import 'package:default_app_flutter/themes/my_themes.dart';
import 'package:default_app_flutter/themes/custom_theme.dart';
import 'package:flutter/material.dart';

import 'services/notifications/firebase_push_notification.dart';
import 'strings.dart';
import 'view/root_page.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseNotifications().setUpFirebase();
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: true,
      theme: CustomTheme.of(context),
      home: RootPage(),
    );
  }
}

