import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'configuration/routes/router.dart';
import 'presentation/features/settings/bloc/settings_bloc.bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsBloc>();

    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      locale: settingsController.locale,
      themeMode: settingsController.themeMode,
      routerConfig: router,
    );
  }
}
