import 'package:book_appointment/utils/firebase_notification_handler.dart';
import 'package:book_appointment/utils/local_notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyNotificationHandler {
  final FirebaseNotificationHandler firebaseNotificationHandler =
      FirebaseNotificationHandler(onBackgroundNotificationHandler,
          (RemoteMessage message) {
    print('onForegroundNotificationHandler');
    // {body: You have a new upcoming appointment!, type: doctor_id, title: Notification, click_action: FLUTTER_NOTIFICATION_CLICK, order_id: 21}
    final data = message.data;
    print(message.data);
    print(message.from);
    print(message.category);
    print(message.collapseKey);
    print(message.mutableContent);
    print(message.threadId);
    print(message.ttl);
    print(message.contentAvailable);
    print(message.senderId);
    print(message.notification.body);
    print(message.notification.title);
    print(message.notification.android);
    print(message.notification.apple);
    print(message.notification.bodyLocArgs);
    print(message.notification.titleLocArgs);
    print(message.notification.titleLocArgs);
    final notification = message.notification;
    LocalNotificationHandler.send(notification.title, notification.body);
  });

  x() {
    firebaseNotificationHandler.handleNotifications();
  }
/*
  final LocalNotificationHandler localNotificationHandler;

  NotificationHandler(this.firebaseNotificationHandler,
      this.localNotificationHandler);

  x() {
    firebaseNotificationHandler
  }
*/

}
