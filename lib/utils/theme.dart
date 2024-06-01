import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme inter = GoogleFonts.interTextTheme();

ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    textTheme: inter.apply(
      bodyColor: const Color(0xFF484954),
      displayColor: const Color(0xFF484954),
    ));
