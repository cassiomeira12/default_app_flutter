import 'dart:io';

import 'package:default_app_flutter/utils/preferences_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;

  final void Function(String) callback;

  FirebaseNotifications(this.callback);

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      print("Token: $token");
      PreferencesUtil.setNotificationToken(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage $message");
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