import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xff3F8782),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Color(0xff3F8782)),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff3F8782),
        splashColor: Color(0xff69AEA9),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(brightness: Brightness.dark);
  }
}
