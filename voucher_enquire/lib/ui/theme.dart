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
  onBackground: Color(0xD9FFFFFF),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light, // Light or dark theme
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? active;
  final Color? onActive;
  final Color? inactive;
  final Color? onInactive;

  const CustomColors(
      {required this.active,
      required this.onActive,
      required this.inactive,
      required this.onInactive});

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      active: Color.lerp(active, other.active, t),
      onActive: Color.lerp(onActive, other.onActive, t),
      inactive: Color.lerp(inactive, other.inactive, t),
      onInactive: Color.lerp(onInactive, other.onInactive, t),
    );
  }

  @override
  CustomColors copyWith({
    Color? active,
    Color? onActive,
    Color? inactive,
    Color? onInactive,
  }) {
    return CustomColors(
      active: active ?? this.active,
      onActive: onActive ?? this.onActive,
      inactive: inactive ?? this.inactive,
      onInactive: onInactive ?? this.onInactive,
    );
  }
}

const CustomColors customColors = CustomColors(
  active: Color(0xFFEAF5EA),
  onActive: Color(0xFF327F32),
  inactive: Color(0xFFFAE7E7),
  onInactive: Color(0xFFCF0B0B),
);

const String fontFamily = 'Roboto';

TextTheme mainTextTheme = const TextTheme(
  displayLarge: TextStyle(
      fontSize: 18, fontFamily: fontFamily, fontWeight: FontWeight.w600),
  displaySmall: TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  ),
  headlineSmall: TextStyle(
    fontSize: 21,
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
  extensions: const [customColors],
);
