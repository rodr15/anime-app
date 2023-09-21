import 'package:flutter/material.dart';

import '../repositories/settings.repository.dart';

/// A service that stores and retrieves user settings.
class SettingsUseCase {
  SettingsUseCase(this._settingsRepository);

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    return await _settingsRepository.getThemeMode();
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    _settingsRepository.setThemeMode(themeMode);
  }

  /// Loads the User's preferred Locale from local or remote storage.
  Future<Locale> locale() async {
    return await _settingsRepository.getLocale();
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateLocale(Locale locale) async {
    _settingsRepository.setLocale(locale);
  }

  final SettingsRepository _settingsRepository;
}
