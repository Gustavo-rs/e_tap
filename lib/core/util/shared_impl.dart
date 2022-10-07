import 'package:app/core/util/i_shared.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServiceImp implements ILocalStorageService {
  @override
  Future<void> clear() {
    try {
      return SharedPreferences.getInstance().then((prefs) {
        prefs.clear();
      });
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> delete(String key) {
    try {
      return SharedPreferences.getInstance().then((prefs) {
        prefs.remove(key);
      });
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<String?> read(String value) {
    try {
      return SharedPreferences.getInstance().then((prefs) {
        return prefs.getString(value);
      });
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> write(String key, String value) {
    try {
      return SharedPreferences.getInstance().then((prefs) {
        prefs.setString(key, value);
      });
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
  }
}
