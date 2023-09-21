import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/repositories/settings.repository.dart';
import 'package:anime/src/domain/usecases/settings.usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'settings.usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SettingsRepository>()])
void main() {
  late SettingsUseCase settingUseCase;
  late SettingsRepository settingsRepository;
  setUp(() {
    settingsRepository = MockSettingsRepository();
    settingUseCase = SettingsUseCase(settingsRepository);
  });

  group('👤 SettingsUseCase ->', () {
    group('getThemeMode', () {
      test('Should return [ThemeMode]', () async {
        when(settingsRepository.getThemeMode())
            .thenAnswer((_) async => ThemeMode.dark);

        final theme = await settingUseCase.themeMode();

        expect(ThemeMode.dark, theme);
      });
      test('Throws Error ', () async {
        when(settingsRepository.getThemeMode())
            .thenAnswer((_) async => throw RequestException.notFound());

        expect(() => settingUseCase.themeMode(), throwsException);
      });
    });
    group('setThemeMode', () {
      test('Call [1] repository ', () async {
        await settingUseCase.updateThemeMode(ThemeMode.dark);

        verify(settingsRepository.setThemeMode(ThemeMode.dark)).called(1);
      });
    });

    group('getLocale', () {
      test('Should return [Locale]', () async {
        when(settingsRepository.getLocale())
            .thenAnswer((_) async => const Locale('es'));

        final locale = await settingUseCase.locale();

        expect(const Locale('es'), locale);
      });
      test('Throws Error ', () async {
        when(settingsRepository.getLocale())
            .thenAnswer((_) async => throw RequestException.notFound());

        expect(() => settingUseCase.locale(), throwsException);
      });
    });
    group('setLocale', () {
      test('Call [1] repository ', () async {
        await settingUseCase.updateLocale(const Locale('es'));

        verify(settingsRepository.setLocale(const Locale('es'))).called(1);
      });
    });
  });
}
