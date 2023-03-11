import 'package:flutter/material.dart';
import 'package:local_notifications/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Notifications _notificationServices = Notifications();

  int _id = 0;

  @override
  void initState() {
    _notificationServices.initializeNotifications();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Notifications")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _id++;

            _notificationServices.showNotification(
              id: _id,
              title: "Title Goes Here",
              body: "Body Goes Here",
            );
          },
          child: const Text("Show Notification"),
        ),
      ),
    );
  }
}
