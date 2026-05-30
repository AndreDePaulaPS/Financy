import 'package:flutter_finance_app/core/session/domain/contracts/i_local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageImpl implements ILocalStorage{
  final FlutterSecureStorage _storage;

  LocalStorageImpl(this._storage);
  
  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<String?> load(String key) async{
    return await _storage.read(key: key);
  }

  @override
  Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }
  
  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}