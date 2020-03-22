import 'package:flutter/material.dart';

import 'strings.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'view/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: true,
      theme: lightTheme(),
      home: RootPage(),
    );
  }
}
