import { Injectable } from '@nestjs/common';
import { DateTime } from 'luxon';
import semver, { SemVer } from 'semver';
import { serverVersion } from 'src/constants';
import { OnEvent, OnJob } from 'src/decorators';
import { ReleaseNotification, ServerVersionResponseDto } from 'src/dtos/server.dto';
import { DatabaseLock, ImmichEnvironment, JobName, JobStatus, QueueName, SystemMetadataKey } from 'src/enum';
import { ArgOf } from 'src/repositories/event.repository';
import { BaseService } from 'src/services/base.service';
import { VersionCheckMetadata } from 'src/types';

const asNotification = ({ checkedAt, releaseVersion }: VersionCheckMetadata): ReleaseNotification => {
  return {
    isAvailable: semver.gt(releaseVersion, serverVersion),
    checkedAt,
    serverVersion: ServerVersionResponseDto.fromSemVer(serverVersion),
    releaseVersion: ServerVersionResponseDto.fromSemVer(new SemVer(releaseVersion)),
  };
};

@Injectable()
export class VersionService extends BaseService {
  @OnEvent({ name: 'AppBootstrap' })
  async onBootstrap(): Promise<void> {
    await this.handleVersionCheck();

    await this.databaseRepository.withLock(DatabaseLock.VersionHistory, async () => {
      const previous = await this.versionRepository.getLatest();
      const current = serverVersion.toString();

      if (!previous) {
        await this.versionRepository.create({ version: current });
        return;
      }

      if (previous.version !== current) {
        const previousVersion = new SemVer(previous.version);

        this.logger.log(`Adding ${current} to upgrade history`);
        await this.versionRepository.create({ version: current });

        const needsNewMemories = semver.lt(previousVersion, '1.129.0');
        if (needsNewMemories) {
          await this.jobRepository.queue({ name: JobName.MemoryGenerate });
        }
      }
    });
  }

  getVersion() {
    return ServerVersionResponseDto.fromSemVer(serverVersion);
  }

  getVersionHistory() {
    return this.versionRepository.getAll();
  }

  async handleQueueVersionCheck() {
    await this.jobRepository.queue({ name: JobName.VersionCheck, data: {} });
  }

  @OnJob({ name: JobName.VersionCheck, queue: QueueName.BackgroundTask })
  async handleVersionCheck(): Promise<JobStatus> {
    try {
      this.logger.debug('Running version check');

      const { environment } = this.configRepository.getEnv();
      if (environment === ImmichEnvironment.Development) {
        return JobStatus.Skipped;
      }

      const { newVersionCheck } = await this.getConfig({ withCache: true });
      if (!newVersionCheck.enabled) {
        return JobStatus.Skipped;
      }

      const versionCheck = await this.systemMetadataRepository.get(SystemMetadataKey.VersionCheckState);
      if (versionCheck?.checkedAt) {
        const lastUpdate = DateTime.fromISO(versionCheck.checkedAt);
        const elapsedTime = DateTime.now().diff(lastUpdate).as('minutes');
        // check once per hour (max)
        if (elapsedTime < 60) {
          return JobStatus.Skipped;
        }
      }

      const { tag_name: releaseVersion, published_at: publishedAt } =
        await this.serverInfoRepository.getGitHubRelease();
      const metadata: VersionCheckMetadata = { checkedAt: DateTime.utc().toISO(), releaseVersion };

      await this.systemMetadataRepository.set(SystemMetadataKey.VersionCheckState, metadata);

      if (semver.gt(releaseVersion, serverVersion)) {
        this.logger.log(`Found ${releaseVersion}, released at ${new Date(publishedAt).toLocaleString()}`);
        this.eventRepository.clientBroadcast('on_new_release', asNotification(metadata));
      }
    } catch (error: Error | any) {
      this.logger.warn(`Unable to run version check: ${error}`, error?.stack);
      return JobStatus.Failed;
    }

    return JobStatus.Success;
  }

  @OnEvent({ name: 'WebsocketConnect' })
  async onWebsocketConnection({ userId }: ArgOf<'WebsocketConnect'>) {
    this.eventRepository.clientSend('on_server_version', userId, serverVersion);
    const metadata = await this.systemMetadataRepository.get(SystemMetadataKey.VersionCheckState);
    if (metadata) {
      this.eventRepository.clientSend('on_new_release', userId, asNotification(metadata));
    }
  }
}
