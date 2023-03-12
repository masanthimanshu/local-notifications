import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings("logo");

  void initializeNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification({required String title, required String body}) async {
    final int id = Random().nextInt(1000);

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId", "channelName");

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
}
