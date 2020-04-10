import 'dart:convert';
import 'dart:io';

import 'package:default_app_flutter/utils/local_notifications.dart';
import 'package:default_app_flutter/utils/preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;

  final notifications = FlutterLocalNotificationsPlugin();

  final void Function(String) callback;

  FirebaseNotifications(this.callback) {
    var settingsAndroid = AndroidInitializationSettings("ic_stat_notification");
    var settingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => onSelectNotification(payload)
    );
    notifications.initialize(
      InitializationSettings(settingsAndroid, settingsIOS), onSelectNotification: onSelectNotification
    );
  }

  static Future<int> sendNotification(String title, String message) async {
    String serverToken = "AAAAWQPCwag:APA91bHIiaTWTTDxL0JMDhblA7du3MNcH-izSvMF20YrpeGiuWsWxzN_SBZe3zc9_1VnNJTFc3BBh50I93uRGNB6toeY4z2O0CHZjgT2YFbvC9UK_TfVgjpF5BJpdsVlP3Wjuf4wyQU-";

    var dio = Dio(BaseOptions(
      baseUrl: "https://fcm.googleapis.com/fcm/send",
      connectTimeout: 5000,
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      }
    ));

    Response response = await dio.post(
      "",
      data: jsonEncode(
        <String, dynamic> {
          'notification': <String, dynamic> {
            'title': title,
            'body': message,
          },
          'priority': 'high',
          'data': <String, dynamic> {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          'to': 'daa-PTmESPSCcDDZeRbsi6:APA91bFlcb5LWQ3Rb0jh0SshXjT6J75TpN1oIfSt6aBnHufWWBG9-10nWPGDKN48hUiVX_QhTnvspKhg0PlSuGOshSL4ApnqptWb_IQtxcNLTyjPaTzJ2b6cg0ewO-ATaPcKGid94DfV'
        }
      ),
    );

    return response.statusCode;
  }

  Future onSelectNotification(String payload) async {
    print("onSelectNotification $payload");
    //await Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(payload: payload));
  }

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      PreferencesUtil.setNotificationToken(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage $message");
        if (message.containsKey('data')) {
          final dynamic data = message['data'];
          print(data);
        }
        if (message.containsKey('notification')) {
          final dynamic notification = message['notification'];
          String title = notification["title"];
          String body = notification["body"];
          print(title);
          print(body);
          showSilentNotification(notifications, title: title, body: body);
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch $message");
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

}