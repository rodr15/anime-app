part of 'settings_bloc.bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.load() = _Load;
  const factory SettingsEvent.update(ThemeMode? newThemeMode) = _Update;
}
