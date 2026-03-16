import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  const primaryColor = Color(0xFF2F80ED);
  const background = Color(0xFF111318);
  const surface = Color(0xFF181B20);
  const onBackground = Color(0xFFF5F5F5);

  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: primaryColor,
      background: background,
      surface: surface,
      onBackground: onBackground,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: background,
      foregroundColor: onBackground,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: background,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}

