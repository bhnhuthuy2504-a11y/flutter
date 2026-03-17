import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({ThemeMode initialMode = ThemeMode.system}) : _themeMode = initialMode;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }
}

