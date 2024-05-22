import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../model/alert_type.dart';

Future<void> saveAlert(Alert alert) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> alerts = prefs.getStringList('alerts') ?? [];
  alerts.add(json.encode(alert.toMap()));
  await prefs.setStringList('alerts', alerts);
}

// Get all alerts
Future<List<Alert>> getAlerts() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> alertsString = prefs.getStringList('alerts') ?? [];
  return alertsString
      .map((alertString) => Alert.fromMap(json.decode(alertString)))
      .toList();


      
}

