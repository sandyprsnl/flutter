import 'package:flutter/material.dart';
import './notification_modal.dart';

class FlutterNotifications extends StatefulWidget {
  static const routName = "FlutterNotifications";
  const FlutterNotifications({Key? key}) : super(key: key);

  @override
  State<FlutterNotifications> createState() => _FlutterNotificationsState();
}

class _FlutterNotificationsState extends State<FlutterNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () => NotificationsModal.showNotification(
                  title: "title", body: 'body', payload: "payload.abs"),
              icon: const Icon(Icons.notification_add),
              label: const Text('Simple Notifications'))
        ],
      ),
    );
  }
}
