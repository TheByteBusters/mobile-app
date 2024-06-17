import 'package:shared_preferences/shared_preferences.dart';

class AuthCache {
  static late SharedPreferences sharedPref;

  static Future<void> cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insert(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static String? getCacheData(String key) {
    return sharedPref.getString(key);
  }

  static Future<bool> deleteCacheItem(String key) async {
    return await sharedPref.remove(key);
  }

  static Future<bool> cleanCache() async {
    return await sharedPref.clear();
  }
}
