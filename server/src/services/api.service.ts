import { Injectable } from '@nestjs/common';
import { Interval } from '@nestjs/schedule';
import { NextFunction, Request, Response } from 'express';
import { readFileSync } from 'node:fs';
import sanitizeHtml from 'sanitize-html';
import { ONE_HOUR } from 'src/constants';
import { ConfigRepository } from 'src/repositories/config.repository';
import { LoggingRepository } from 'src/repositories/logging.repository';
import { AuthService } from 'src/services/auth.service';
import { JobService } from 'src/services/job.service';
import { SharedLinkService } from 'src/services/shared-link.service';
import { VersionService } from 'src/services/version.service';
import { OpenGraphTags } from 'src/utils/misc';

const render = (index: string, meta: OpenGraphTags) => {
  const [title, description, imageUrl] = [meta.title, meta.description, meta.imageUrl].map((item) =>
    item ? sanitizeHtml(item, { allowedTags: [] }) : '',
  );

  const tags = `
    <meta name="description" content="${description}" />

    <!-- Facebook Meta Tags -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="${title}" />
    <meta property="og:description" content="${description}" />
    ${imageUrl ? `<meta property="og:image" content="${imageUrl}" />` : ''}

    <!-- Twitter Meta Tags -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="${title}" />
    <meta name="twitter:description" content="${description}" />

    ${imageUrl ? `<meta name="twitter:image" content="${imageUrl}" />` : ''}`;

  return index.replace('<!-- metadata:tags -->', tags);
};

@Injectable()
export class ApiService {
  constructor(
    private authService: AuthService,
    private jobService: JobService,
    private sharedLinkService: SharedLinkService,
    private versionService: VersionService,
    private configRepository: ConfigRepository,
    private logger: LoggingRepository,
  ) {
    this.logger.setContext(ApiService.name);
  }

  @Interval(ONE_HOUR.as('milliseconds'))
  async onVersionCheck() {
    await this.versionService.handleQueueVersionCheck();
  }

  ssr(excludePaths: string[]) {
    const { resourcePaths } = this.configRepository.getEnv();

    let index = '';
    try {
      index = readFileSync(resourcePaths.web.indexHtml).toString();
    } catch {
      this.logger.warn(`Unable to open ${resourcePaths.web.indexHtml}, skipping SSR.`);
    }

    return async (request: Request, res: Response, next: NextFunction) => {
      if (
        request.url.startsWith('/api') ||
        request.method.toLowerCase() !== 'get' ||
        excludePaths.some((item) => request.url.startsWith(item))
      ) {
        return next();
      }

      let status = 200;
      let html = index;

      const shareMatches = request.url.match(/^\/share\/(.+)$/);
      if (shareMatches) {
        try {
          const key = shareMatches[1];
          const auth = await this.authService.validateSharedLinkKey(key);
          const meta = await this.sharedLinkService.getMetadataTags(
            auth,
            request.host ? `${request.protocol}://${request.host}` : undefined,
          );
          if (meta) {
            html = render(index, meta);
          }
        } catch {
          status = 404;
        }
      }

      res.status(status).type('text/html').header('Cache-Control', 'no-store').send(html);
    };
  }
}
