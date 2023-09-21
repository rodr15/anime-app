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
          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
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
    group('Event [UpdateTheme] ->', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added with valid ThemeMode .',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.system);
          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateTheme(ThemeMode.light));
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
          verifyNever(settingsUseCase.updateLocale(const Locale('es')));
          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added same ThemeMode.',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);
          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateTheme(ThemeMode.light));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.locale()).called(1);
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

          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateTheme(null));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.locale()).called(1);

          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));

          verifyNoMoreInteractions(settingsUseCase);

          expect(settingsBloc.themeMode, ThemeMode.light);
        },
      );
    });

    group('Event [UpdateLocale] ->', () {
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added with valid locale .',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.system);
          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateLocale(Locale('en')));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.updateLocale(const Locale('en'))).called(1);
          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));
          expect(settingsBloc.themeMode, ThemeMode.system);
          expect(settingsBloc.locale, const Locale('en'));
        },
      );

      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added same locale.',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);
          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateLocale(Locale('es')));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.locale()).called(1);
          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));
          verifyNever(settingsUseCase.updateLocale(const Locale('es')));

          verifyNoMoreInteractions(settingsUseCase);

          expect(settingsBloc.locale, const Locale('es'));
        },
      );
      blocTest<SettingsBloc, SettingsState>(
        'emits [Loading,Loaded,Loading,Loaded] when update is added null ThemeMode.',
        build: () => settingsBloc,
        setUp: () {
          when(settingsUseCase.themeMode())
              .thenAnswer((_) async => ThemeMode.light);

          when(settingsUseCase.locale())
              .thenAnswer((_) async => const Locale('es'));
        },
        act: (bloc) async {
          bloc.add(const SettingsEvent.load());
          await Future.delayed(const Duration(milliseconds: 1));
          bloc.add(const SettingsEvent.updateLocale(null));
        },
        expect: () => const <SettingsState>[
          SettingsState.loading(),
          SettingsState.loaded(),
          SettingsState.loading(),
          SettingsState.loaded(),
        ],
        verify: (bloc) {
          verify(settingsUseCase.themeMode()).called(1);
          verify(settingsUseCase.locale()).called(1);

          verifyNever(settingsUseCase.updateThemeMode(ThemeMode.light));
          verifyNever(settingsUseCase.updateLocale(const Locale('es')));

          verifyNoMoreInteractions(settingsUseCase);

          expect(settingsBloc.themeMode, ThemeMode.light);
          expect(settingsBloc.locale, const Locale('es'));
        },
      );
    });
  });
}
