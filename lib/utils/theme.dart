import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme inter = GoogleFonts.interTextTheme();

ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
     
    ),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8FAFC),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: inter.apply(
      bodyColor: const Color(0xFF484954),
      displayColor: const Color(0xFF484954),
    ));
