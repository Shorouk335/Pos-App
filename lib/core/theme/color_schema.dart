import 'package:flutter/material.dart';

class AppColorsSchema extends ColorScheme {
  const AppColorsSchema(
      {required super.brightness,
      required super.primary,
      required super.onPrimary,
      required super.secondary,
      required super.onSecondary,
      required super.error,
      required super.onError,
      required super.surface,
      required super.onSurface});

  static AppColorsSchema lightSchema = AppColorsSchema(
    brightness: Brightness.light,
    // primary: Color(0xff0A3B74),
    // primary: Color(0xff3570CE),
     primary: Color(0xff0A3B74),
    // onPrimary: Color(0xff7DB343),
    // onPrimary: Color(0xffBA8D2D),
    onPrimary: Color(0xff4184d3),
    secondary: Colors.black, // normal text
    onSecondary: Colors.black.withOpacity(0.5), // hint text
    surface: Colors.white, //  light background
    error: Color(0xffF83E3E),
    onError: Color(0xffF83E3E),
    onSurface: Colors.black, // color ot tooltip (copy, paste button)
  );

  static AppColorsSchema darkSchema = AppColorsSchema(
    brightness: Brightness.dark,
     primary: Color(0xff0A3B74),
    onPrimary: Color(0xff4184d3),
    secondary: Colors.white, // normal text
    onSecondary: Colors.white70, //hint text
    surface: Color(0xff303030), // dark background
    error: Color(0xffF83E3E),
    onError: Color(0xffF83E3E),
    onSurface: Colors.white, // color ot tooltip (copy, paste button)
  );
}
