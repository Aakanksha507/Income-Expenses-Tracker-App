import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xff2A7C76),
      cardColor: Color(0xff2F7E79),
      textTheme: TextTheme(
        titleSmall: TextStyle(color: Colors.grey),
        titleMedium: TextStyle(color: Colors.grey[700]),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Color(0xff3F8782)),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff3F8782),
        splashColor: Color(0xff69AEA9),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xffECF9F8)),
        ),
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
