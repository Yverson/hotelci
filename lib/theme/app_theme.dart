import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(color: Colors.black),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
