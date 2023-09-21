import 'package:flutter/material.dart';

abstract class SettingsRepository {
  /// get the theme mode saved by the user
  Future<ThemeMode> getThemeMode();

  /// save [themeMode] in user settings preferences
  void setThemeMode(ThemeMode themeMode);

  /// get the theme mode saved by the user
  Future<Locale> getLocale();

  /// save [locale] in user settings preferences
  void setLocale(Locale locale);
}
