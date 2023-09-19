import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'debug/observer.bloc.dart';
import 'src/app.dart';
import 'src/configuration/di/dependency_injection.dart';
import 'src/presentation/features/settings/bloc/settings_bloc.bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider.value(
      value: di<SettingsBloc>(),
      child: const MyApp(),
    ),
  );
}
