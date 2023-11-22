import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mint,


      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey));
  static ThemeData darkTheme = ThemeData();
}
