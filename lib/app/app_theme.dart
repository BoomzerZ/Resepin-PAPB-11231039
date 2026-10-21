import 'package:flutter/material.dart';

abstract class AppTheme {
  static const background = Color(0xFFFFFBF5);
  static const brown = Color(0xFF4A2C1A);
  static const orange = Color(0xFFF39A22);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(seedColor: orange),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: brown,
      elevation: 0,
    ),
  );
}
