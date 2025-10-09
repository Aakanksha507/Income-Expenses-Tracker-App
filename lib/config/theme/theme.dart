import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xff429690),
      cardColor: Color(0xff1B5C58),
      textTheme: TextTheme(
        titleSmall: TextStyle(color: Colors.grey),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Color(0xff3F8782)),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff3F8782),
        splashColor: Color(0xff69AEA9),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff3F8782),
        splashColor: Color(0xff69AEA9),
      ),
      cardTheme: CardThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(brightness: Brightness.dark);
  }
}
