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
          emit(const _Loaded());
        },
        update: (newThemeMode) async {
          emit(const _Loading());
          if (newThemeMode == null) return;
          if (newThemeMode == _themeMode) return;
          _themeMode = newThemeMode;
          emit(const _Loaded());

          await _settingsService.updateThemeMode(newThemeMode);
        },
      );
    });
  }
  final SettingsService _settingsService;
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
}
