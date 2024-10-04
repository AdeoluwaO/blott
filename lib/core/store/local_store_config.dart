import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences?> initializeLocalStorage() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  storeInt({required String key, required int? val}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.setInt(key, val ?? 0);
    return response;
  }

  getStoredInt({required String key}) async {
    await initializeLocalStorage();
    return _sharedPreferences?.getInt(key);
  }

  storeBool({required String key, required bool? val}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.setBool(key, val ?? false);
    return response;
  }

  getStoredBool({required String key}) async {
    await initializeLocalStorage();
    return _sharedPreferences?.getBool(key);
  }

  storeDouble({required String key, required double? val}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.setDouble(key, val ?? 0);
    return response;
  }

  getStoredDouble({required String key}) async {
    await initializeLocalStorage();
    return _sharedPreferences?.getDouble(key);
  }

  storeString({required String key, required String? val}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.setString(key, val ?? '');
    return response;
  }

  getStoredString({required String key}) async {
    await initializeLocalStorage();
    return _sharedPreferences?.getString(key);
  }

  storeStringList({required String key, required List<String>? val}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.setStringList(key, val ?? []);
    return response;
  }

  getStoredStringList({required String key}) async {
    await initializeLocalStorage();
    return _sharedPreferences?.getStringList(key);
  }

  getStoredKeys() async {
    await initializeLocalStorage();
    return _sharedPreferences?.getKeys();
  }

  getStroredItem({required String key}) async {
    await initializeLocalStorage();
    _sharedPreferences?.get(key);
  }

  removeStroredItem({required String key}) async {
    await initializeLocalStorage();
    final response = await _sharedPreferences?.remove(key);
    return response;
  }

  clearLocalStorage() async {
    final response = await _sharedPreferences?.clear();
    return response;
  }
}
