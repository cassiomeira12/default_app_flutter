import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationDetails get _noSound {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    'silent channel description',
    playSound: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showSilentNotification(
  FlutterLocalNotificationsPlugin notifications,
  {
    @required String title,
    @required String body,
    int id = 0,
  }
) => _showNotification(notifications, title: title, body: body, type: _noSound);

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'yout channel id',
    'yout channel name',
    'yout channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications,
  {
    @required String title,
    @required String body,
    int id = 0,
  }
) => _showNotification(notifications, title: title, body: body, type: _ongoing);

Future _showNotification(
  FlutterLocalNotificationsPlugin notifications,
  {
    @required String title,
    @required String body,
    @required NotificationDetails type,
    int id = 0,
  }
) => notifications.show(id, title, body, type);
