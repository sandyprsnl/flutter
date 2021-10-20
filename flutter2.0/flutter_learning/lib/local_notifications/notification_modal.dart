import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsModal {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifications.show(id, title, body, await _notificationDetails(),
        payload: payload);
  }

  static Future _notificationDetails() async {
    // notification setting
    var androidInitilize = const AndroidInitializationSettings(
        'app_icon'); //must avaliable in android\app\src\main\res\drawable directory
    var iosInitilize = const IOSInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iosInitilize);
    _notifications.initialize(initilizationsSettings,
        onSelectNotification: onSelectNotification);

    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "chandelid",
        'channel name',
        channelDescription: "desc",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future onSelectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
  }
}
