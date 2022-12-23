import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationHandler {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<bool> init() async {
    return flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings(
          'app_icon',
        ),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  static Future<void> send(String title, String body) {
    return flutterLocalNotificationsPlugin.show(
        Random().nextInt(999999999),
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ));
  }
}
