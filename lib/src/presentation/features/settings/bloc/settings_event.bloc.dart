part of 'settings_bloc.bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.load() = _Load;
  const factory SettingsEvent.updateTheme(ThemeMode? newThemeMode) =
      _UpdateTheme;
  const factory SettingsEvent.updateLocale(Locale? newLocale) = _UpdateLocale;
}
