import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'debug/observer.bloc.dart';
import 'src/app.dart';
import 'src/configuration/di/dependency_injection.dart';
import 'src/presentation/features/search/controller/search_bloc.bloc.dart';
import 'src/presentation/features/settings/settings_controller.dart';
import 'src/presentation/features/settings/settings_service.dart';

void main() async {
  await setupDependencies();
  Bloc.observer = MyBlocObserver();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(
    BlocProvider.value(
      value: di<SearchBloc>(),
      child: MyApp(settingsController: settingsController),
    ),
  );
}
