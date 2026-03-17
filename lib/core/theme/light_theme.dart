import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  const primaryColor = Color(0xFF2F80ED);
  const background = Color(0xFFFFFFFF);
  const surface = Color.fromARGB(255, 233, 230, 230);
  const onBackground = Color(0xFF111111);

  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.light(
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
      iconColor: Colors.black87,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
    ),
  );
}

