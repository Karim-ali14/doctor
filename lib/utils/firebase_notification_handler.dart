import 'package:book_appointment/utils/local_notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

typedef NotificationHandler = Future<void> Function(RemoteMessage message);
Future<void> onBackgroundNotificationHandler(RemoteMessage message) {
  print('onBackgroundNotificationHandler');
  print('!!');
  // LocalNotificationHandler.send(title, body);
}

/*
Future<void> onBackgroundNotificationHandlerr(RemoteMessage message) {
}
*/

class FirebaseNotificationHandler {
  final NotificationHandler onBackgroundNotificationHandler,
      onForegroundNotificationHandler;

  FirebaseNotificationHandler(this.onBackgroundNotificationHandler,
      this.onForegroundNotificationHandler);

  static Future<AuthorizationStatus> getPermissionAuthorizationStatus() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus;
  }

  static void subscribeToTopic(String topicName) {
    FirebaseMessaging.instance.subscribeToTopic(topicName);
  }

  static void subscribeToAllTopic() {
    subscribeToTopic('all');
  }

  handleBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotificationHandler);
  }

  handleForegroundMessage(NotificationHandler notificationHandler) {
    FirebaseMessaging.onMessage.listen(notificationHandler);
  }

  void handleNotifications() {
    handleForegroundMessage(onForegroundNotificationHandler);
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotificationHandler);
  }
}
/*
  static Future<void> _onBackgroundNotificationHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  static Future<void> _onForegroundNotificationHandler(
      RemoteMessage message) async {}
*/
