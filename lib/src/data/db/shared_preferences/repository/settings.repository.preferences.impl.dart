import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/repositories/settings.repository.dart';

class SettingsRepositoryPreferencesImpl implements SettingsRepository {
  SettingsRepositoryPreferencesImpl(this._preferences);
  final SharedPreferences _preferences;

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeModeIndex = _preferences.getInt('themeMode');

    return themeModeIndex == null
        ? ThemeMode.system
        : ThemeMode.values[themeModeIndex];
  }

  @override
  void setThemeMode(ThemeMode themeMode) {
    _preferences.setInt('themeMode', themeMode.index);
  }
}
