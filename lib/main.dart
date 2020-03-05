import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/root_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'themes/light.theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: true,
      theme: lightTheme(),
      home: new RootPage(),
    );
  }
}