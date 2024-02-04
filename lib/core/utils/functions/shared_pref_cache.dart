import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefCache {
  static late SharedPreferences sharedPref;

  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

 static Future<void> saveLanguage(Locale locale) async {
    await sharedPref.setString('languageCode', locale.languageCode);
  }

 static Future<Locale?> getSavedLanguage() async {
    final languageCode = sharedPref.getString('languageCode');
    return languageCode != null ? Locale(languageCode) : null;
  }

  static Future<bool> insertToCache(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static Future<String?> getCacheData({required String key}) async {
    return sharedPref.getString(key);
  }

  static Future<bool> deleteCacheItem({required String key}) async {
    return await sharedPref.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPref.clear();
  }
}
