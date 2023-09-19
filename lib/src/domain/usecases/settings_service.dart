import 'package:flutter/material.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    //TODO: Implement this
    return ThemeMode.system;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    //TODO: Use the shared_preferences package to persist settings locally or the
  }
}
