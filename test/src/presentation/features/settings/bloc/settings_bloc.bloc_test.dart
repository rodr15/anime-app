import 'package:anime/src/domain/usecases/settings.usecase.dart';
import 'package:anime/src/presentation/features/settings/bloc/settings_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'settings_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SettingsUseCase>()])
void main() {
  late SettingsBloc settingsBloc;
  late SettingsUseCase settingsUseCase;
  setUp(() {
    settingsUseCase = MockSettingsUseCase();
    settingsBloc = SettingsBloc(settingsUseCase);
  });

  group(' 👀 SettingsBloc ->  ', () {
    group('Event [Load] ->', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded] when load is added.',
        build: () => settingsBloc,
        act: (bloc) => bloc.add(const SettingsEvent.load()),
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );
    });
    group('Event [Update] ->', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added with valid ThemeMode .',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.system);
        },
        act: (bloc) {
          bloc.add(const SettingsEvent.load());
          bloc.add(const SettingsEvent.update(ThemeMode.light));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.updateThemeMode(ThemeMode.light)).called(1);

          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added same ThemeMode.',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);
        },
        act: (bloc) {
          bloc.add(const SettingsEvent.load());
          bloc.add(const SettingsEvent.update(ThemeMode.light));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));

          verifyNoMoreInteractions(settingsUseCase);

          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added null ThemeMode.',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);
        },
        act: (bloc) {
          bloc.add(const SettingsEvent.load());
          bloc.add(const SettingsEvent.update(null));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));

          verifyNoMoreInteractions(settingsUseCase);

          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );
    });
  });
}
