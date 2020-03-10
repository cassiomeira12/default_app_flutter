import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF00C569);
const lightColor = const Color(0xFFFFFFFF);
const backgroudColor = const Color(0xFFF5F5F5);

ThemeData darkTheme() {
  return ThemeData(
    // primarySwatch: primaryColor,
    brightness: brightness,
    textTheme: new TextTheme(
      body1: new TextStyle(color: Colors.black),
      display2: new TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      display4: new TextStyle(fontSize: 78),
      button: new TextStyle(color: Colors.green),
      headline: new TextStyle(color: Colors.white),
    ),
    // tabBarTheme:
    // accentIconTheme:
    // accentTextTheme:
    // appBarTheme:
    // bottomAppBarTheme:
    // buttonTheme: new ButtonThemeData(
    //   buttonColor: Colors.orange,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // cardTheme: CardTheme(
    //   elevation: 5,
    //   color: Colors.indigo,
    // ),
    // chipTheme:
    // dialogTheme:
    // floatingActionButtonTheme:
    // iconTheme:
    // inputDecorationTheme:
    // pageTransitionsTheme:
    // primaryIconTheme:
    // primaryTextTheme:
    // sliderTheme:
    primaryColor: primaryColor,
    accentColor: Colors.black26,
    // fontFamily: 'Montserrat',
    // buttonColor: Color(0xFF00C569),
    // // scaffoldBackgroundColor: backgroundColor,
    // cardColor: Colors.white,
  );
}
