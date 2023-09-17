import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/data/jikan/repository/anime.repository.jikan.impl.dart';
import 'src/domain/usecases/anime.usecase.dart';
import 'src/presentation/features/search/controller/search_bloc.bloc.dart';
import 'src/presentation/features/settings/settings_controller.dart';
import 'src/presentation/features/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(
    BlocProvider(
      create: (context) => SearchBloc(AnimeUseCase(AnimeRepositoryJikanImpl()))
        ..add(const SearchEvent.started()),
      child: MyApp(settingsController: settingsController),
    ),
  );
}
