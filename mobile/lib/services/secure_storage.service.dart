import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:immich_mobile/repositories/secure_storage.repository.dart';

final secureStorageServiceProvider = Provider(
  (ref) => SecureStorageService(ref.watch(secureStorageRepositoryProvider)),
);

class SecureStorageService {
  final SecureStorageRepository _secureStorageRepository;

  const SecureStorageService(this._secureStorageRepository);

  Future<void> write(String key, String value) async {
    await _secureStorageRepository.write(key, value);
  }

  Future<void> delete(String key) async {
    await _secureStorageRepository.delete(key);
  }

  Future<String?> read(String key) async {
    return _secureStorageRepository.read(key);
  }
}
