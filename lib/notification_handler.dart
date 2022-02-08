import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationHandler {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<bool> init() async {
    return flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings(
          'app_icon',
        ),
        iOS: IOSInitializationSettings(),
      ),
    );
  }

  static void send(String title, String body) {
    flutterLocalNotificationsPlugin.show(
        1,
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
