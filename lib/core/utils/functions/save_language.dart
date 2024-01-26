import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLanguage(Locale locale) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('languageCode', locale.languageCode);
}

Future<Locale?> getSavedLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('languageCode');
  return languageCode != null ? Locale(languageCode) : null;
}
