import 'package:flutter/material.dart';

ColorScheme mainColorScheme = const ColorScheme(
  primary: Color(0xFF004E96),
  secondary: Color(0xFFF0D848),
  surface: Color(0xFFFFFFFF),
  background: Color(0xFF0A4E90),
  error: Color(0xFFB00020),
  onPrimary: Color(0xFFFFF267),
  onSecondary: Color(0xFF000930),
  onSurface: Color(0xFF000930),
  onBackground: Color(0xFF000000),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light, // Light or dark theme
);

const String fontFamily = 'Roboto';

TextTheme mainTextTheme = const TextTheme(
  headlineSmall: TextStyle(
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  ),
  labelLarge: TextStyle(
    fontSize: 16,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  ),
);

ThemeData mainTheme = ThemeData(
  colorScheme: mainColorScheme,
  textTheme: mainTextTheme,
  useMaterial3: true,
);
