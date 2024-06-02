import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

LinearGradient? colorToGradient(Color color) {
  final String key = color.hex;
  const Map<String, LinearGradient> colorsGrads = {
    'FFBE0B': LinearGradient(
      colors: [
        Color(0xFFFFBE0B),
        Color(0xD9FFBE0B),
        Color(0x8CFFBE0B),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    'FF9B71': LinearGradient(
      colors: [
        Color(0xFFFF9B71),
        Color(0xD9FF9B71),
        Color(0x8CFF9B71),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    'FB5607': LinearGradient(
      colors: [
        Color(0xffffb5607),
        Color(0xd9ffb5607),
        Color(0x8cffb5607),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    '97512C': LinearGradient(
      colors: [
        Color(0xFF97512C),
        Color(0xD997512C),
        Color(0x8C97512C),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    'DBBADD': LinearGradient(
      colors: [
        Color(0xFFDBBADD),
        Color(0xD9DBBADD),
        Color(0x8CDBBADD),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    'FF006E': LinearGradient(
      colors: [
        Color(0xFFFF006E),
        Color(0xD9FF006E),
        Color(0x8CFF006E),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    'A9F0D1': LinearGradient(
      colors: [
        Color(0xFFA9F0D1),
        Color(0xD9A9F0D1),
        Color(0x8CA9F0D1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    '00B402': LinearGradient(
      colors: [
        Color(0xFF00B402),
        Color(0xD900B402),
        Color(0x8C00B402),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    '489DDA': LinearGradient(
      colors: [
        Color(0xFF489DDA),
        Color(0xD9489DDA),
        Color(0x8C489DDA),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    '0072E8': LinearGradient(
      colors: [
        Color(0xFF0072E8),
        Color(0xD90072E8),
        Color(0x8C0072E8),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    '8338EC': LinearGradient(
      colors: [
        Color(0xFF8338EC),
        Color(0xD98338EC),
        Color(0x8C8338EC),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  };

  return colorsGrads[key];
}
