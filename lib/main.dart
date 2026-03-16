import 'package:flutter/material.dart';

import 'core/theme/light_theme.dart';
import 'core/theme/dark_theme.dart';
import 'features/account/presentation/pages/account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      home: const AccountPage(),
    );
  }
}