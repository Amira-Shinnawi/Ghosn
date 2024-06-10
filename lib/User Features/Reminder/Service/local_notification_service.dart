import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ghosn_app/User%20Features/Reminder/model/alert_type.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/app_icon'),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: onTap,
        onDidReceiveNotificationResponse: onTap);
  }

  static Future<void> showScheduledNotification(Alert alert) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('id_3', 'scheduled_notification',
            importance: Importance.max, priority: Priority.high);

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    tz.initializeTimeZones();

    log(tz.local.name);
    log(tz.TZDateTime.now(tz.local).hour.toString());
    // final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var tzScheduledDate = tz.TZDateTime.from(alert.dateTime, tz.local);

    log(tz.local.name);
    log(tz.TZDateTime.now(tz.local).hour.toString());
    if (alert.alertType == 'daily') {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Daily Reminder: ${alert.title}',
        alert.note,
        tzScheduledDate,
        details,
        matchDateTimeComponents:
            DateTimeComponents.time, // Schedules daily at a specific time
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    } else if (alert.alertType == 'weekly') {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Weekly Reminder: ${alert.title}',
        alert.note,
        tzScheduledDate,
        details,
        matchDateTimeComponents: DateTimeComponents
            .dayOfWeekAndTime, // Schedules weekly on the same day and time
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    } else if (alert.alertType == 'monthly') {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Monthly Reminder: ${alert.title}',
        alert.note,
        tzScheduledDate,
        details,
        matchDateTimeComponents: DateTimeComponents
            .dayOfMonthAndTime, // Schedules monthly on the same day and time
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    }
  }
}
