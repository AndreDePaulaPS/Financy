abstract interface class ILocalStorage {
  Future<void> save(String key, String value);
  Future<String?> load(String key);
  Future<void> delete(String key);
  Future<void> deleteAll();
}
