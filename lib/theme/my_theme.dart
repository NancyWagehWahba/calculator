import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    primaryColor: Colors.white,
    primaryColorLight: const Color(0xFFCECECE),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      //result
      headline1: TextStyle(fontSize: 48, color: Colors.black),
      //calculations
      headline4: TextStyle(fontSize: 24, color: Color(0xFF524F4F)),
      //firstLineBn
      bodyText1: TextStyle(
          fontSize: 14,
          color: Color(0xFF7CC9FF),
          backgroundColor: Color(0xFFFFFFFF)),
      //DeleteBn
      bodyText2: TextStyle(
          fontSize: 20,
          color: Color(0xFF858585),
          backgroundColor: Color(0xFFFFFFFF)),
      //operators
      headline6: TextStyle(
          fontSize: 25,
          color: Color(0xFF109DFF),
          backgroundColor: Color(0xFFADE2FF)),
      //numbers
      headline5: TextStyle(
          fontSize: 30,
          color: Color(0xFF38B9FF),
          backgroundColor: Color(0xFFFFFFFF)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF858585),
      size: 25,
    ),
  );

  static ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    primaryColorLight: const Color(0xFF3A3A3A),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      //result
      headline1: TextStyle(fontSize: 48, color: Colors.white),
      //calculations
      headline4: TextStyle(fontSize: 24, color: Color(0xFF524F4F)),
      //firstLineBn
      bodyText1: TextStyle(
          fontSize: 14,
          color: Color(0xFF29A8FF),
          backgroundColor: Color(0xFF303136)),
      //DeleteBn
      bodyText2: TextStyle(
          fontSize: 20,
          color: Color(0xFFA5A5A5),
          backgroundColor: Color(0xFF616161)),
      //operators
      headline6: TextStyle(
          fontSize: 25,
          color: Color(0xFF339DFF),
          backgroundColor: Color(0xFF005DB2)),
      //numbers
      headline5: TextStyle(
          fontSize: 30,
          color: Color(0xFF29A8FF),
          backgroundColor: Color(0xFF303136)),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF858585),
      size: 25,
    ),
  );
}
