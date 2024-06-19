import 'package:shared_preferences/shared_preferences.dart';

class AuthCache {
  static late SharedPreferences sharedPref;

  static Future<void> cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertString(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static Future<bool> insertDouble(String key, double value) async {
    return await sharedPref.setDouble(key, value);
  }

  static dynamic getCacheData(String key) {
    return sharedPref.get(key);
  }

  static Future<bool> deleteCacheItem(String key) async {
    return await sharedPref.remove(key);
  }

  static Future<bool> cleanCache() async {
    return await sharedPref.clear();
  }

  static Future<bool> insertMap(Map<String, dynamic> data) async {
    try {
      for (var item in data.entries) {
        if (item.value is double) {
          await sharedPref.setDouble(item.key, item.value);
        } else {
          await sharedPref.setString(item.key, item.value);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
