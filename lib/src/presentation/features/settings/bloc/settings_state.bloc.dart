part of 'settings_bloc.bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded() = _Loaded;
}
