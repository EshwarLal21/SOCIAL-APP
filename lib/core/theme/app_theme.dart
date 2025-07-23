import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF10BB24),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF10BB24),
      secondary: Color(0xFFFFD700),
      tertiary: Color(0xFFB9F4B6),
      surface: Color(0xFFEFECEC),
      background: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      labelLarge: TextStyle(color: Colors.white, fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0, // No elevation/shadow
      backgroundColor: Colors.white, // Solid background
      foregroundColor: Colors.black, // Title color
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF10BB24),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF10BB24),
      secondary: Color(0xFFFFD700),
      tertiary: Color(0xFFB9F4B6),
      surface: Color(0xFF1E1E1E),
      background: Colors.black,
      onPrimary: Colors.black,
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      labelLarge: TextStyle(color: Colors.black, fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0, // No elevation/shadow
      backgroundColor: Colors.black, // Solid background
      foregroundColor: Colors.white, // Title color
    ),
  );
}
