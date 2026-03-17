import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/light_theme.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/account/presentation/pages/account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Smart Home',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            home: const AccountPage(),
          );
        },
      ),
    );
  }
}
