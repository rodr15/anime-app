import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/usecases/settings.usecase.dart';

part 'settings_bloc.bloc.freezed.dart';
part 'settings_event.bloc.dart';
part 'settings_state.bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._settingsService) : super(const _Loading()) {
    on<SettingsEvent>((event, emit) async {
      await event.when(
        load: () async {
          emit(const _Loading());
          _themeMode = await _settingsService.themeMode();
          _locale = await _settingsService.locale();
          emit(const _Loaded());
        },
        updateTheme: (newThemeMode) async {
          emit(const _Loading());
          if (newThemeMode == null) {
            emit(const _Loaded());
            return;
          }

          if (newThemeMode == _themeMode) {
            emit(const _Loaded());
            return;
          }
          _themeMode = newThemeMode;
          emit(const _Loaded());

          await _settingsService.updateThemeMode(newThemeMode);
        },
        updateLocale: (newLocale) async {
          emit(const _Loading());
          if (newLocale == null) {
            emit(const _Loaded());
            return;
          }

          if (newLocale == _locale) {
            emit(const _Loaded());
            return;
          }
          _locale = newLocale;
          emit(const _Loaded());

          await _settingsService.updateLocale(newLocale);
        },
      );
    });
  }
  final SettingsUseCase _settingsService;
  late ThemeMode _themeMode;
  late Locale _locale;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
}
