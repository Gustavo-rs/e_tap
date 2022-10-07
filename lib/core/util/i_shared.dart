abstract class ILocalStorageService {
  Future<String?> read(String value);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}
