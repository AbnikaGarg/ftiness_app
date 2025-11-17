import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    cardColor: Color.fromRGBO(240, 240, 240, 1),
    canvasColor: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: "Nunito",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Color.fromRGBO(196, 196, 196, 1),
    
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey.shade900,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
     progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Color.fromRGBO(138, 138, 138, 1),
    
      color: Colors.white,
    ),
    canvasColor: Color.fromRGBO(255, 255, 255, 1),
    cardColor: Color.fromRGBO(50, 50, 50, 1),
    scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
    primaryColor: Colors.white,
    fontFamily: "Nunito",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
    ),
  );
}
