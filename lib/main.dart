import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/configuration/di/dependency_injection.dart';
import 'src/presentation/features/settings/bloc/settings_bloc.bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await setupDependencies();

  if (kDebugMode) {
    // Bloc.observer = MyBlocObserver();
  }

  runApp(
    BlocProvider.value(
      value: di<SettingsBloc>(),
      child: const MyApp(),
    ),
  );
}
