import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  bool _isDarkMode = false;

  bool get themeValue => _isDarkMode;

  set themeValue(bool newValue) {
    _isDarkMode = newValue;
    _saveThemeToPreferences(newValue);
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  ThemeProvider() {
    _loadThemeFromPreferences();
  }

  /// Save theme preference to SharedPreferences
  void _saveThemeToPreferences(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDarkTheme', value);
  }

  /// Load theme preference from SharedPreferences
  void _loadThemeFromPreferences() async {
    final pref = await SharedPreferences.getInstance();
    _isDarkMode = pref.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }
}
