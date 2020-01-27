import 'package:flutter/material.dart';

class ITheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: Color.fromRGBO(255, 255, 255, 1),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
    canvasColor: Color.fromRGBO(255, 255, 255, 1),
    cardColor: Color.fromRGBO(255, 255, 255, 1),
    iconTheme: IconThemeData(color: Colors.black54),
    accentIconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.black54),
    accentColor: Colors.blueAccent,
  );

  static ThemeData dark = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: Color.fromRGBO(9, 16, 16, 1),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(19, 26, 26, 1),
    canvasColor: Color.fromRGBO(9, 16, 16, 1),
    cardColor: Color.fromRGBO(34, 41, 41, 1),
    accentColor: Colors.teal,
  );
}
