import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/db/isar/anime/repository/user_list.repository.isar.impl.dart';
import '../../data/db/isar/isar.export.dart';
import '../../data/db/shared_preferences/repository/settings.repository.preferences.impl.dart';
import '../../data/jikan/anime/repository/anime.repository.jikan.impl.dart';
import '../../data/jikan/character/repository/character.repository.jikan.impl.dart';
import '../../domain/repositories/anime.repository.dart';
import '../../domain/repositories/character.repository.dart';
import '../../domain/repositories/settings.repository.dart';
import '../../domain/repositories/user_list.repository.dart';
import '../../domain/usecases/anime.usecase.dart';
import '../../domain/usecases/settings.usecase.dart';
import '../../domain/usecases/user_list.usecase.dart';
import '../../presentation/features/details/controller/details_bloc.bloc.dart';
import '../../presentation/features/my-list/controller/my_list_bloc.bloc.dart';
import '../../presentation/features/popular_anime/controller/popular_anime_bloc.bloc.dart';
import '../../presentation/features/search/controller/search_bloc.bloc.dart';
import '../../presentation/features/settings/bloc/settings_bloc.bloc.dart';

final GetIt di = GetIt.instance;

/// Set up all project dependencies
Future<void> setupDependencies() async {
  //* DB ISAR
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AnimeEntityIsarSchema],
    directory: dir.path,
  );

  di.registerSingleton<Isar>(isar);

  //* DB SHARED PREFERENCES
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  di.registerSingleton<SharedPreferences>(sharedPreferences);

  //* Repository
  di.registerSingleton<AnimeRepository>(AnimeRepositoryJikanImpl());
  di.registerSingleton<UserListRepository>(UserListIsarRepositoryImpl(di()));
  di.registerSingleton<SettingsRepository>(
      SettingsRepositoryPreferencesImpl(di()));
  di.registerSingleton<CharacterRepository>(CharacterRepositoryJikanImpl());

  //* UseCase
  di.registerFactory<AnimeUseCase>(() => AnimeUseCase(di(), di()));
  di.registerFactory<UserListUseCase>(() => UserListUseCase(di()));
  di.registerFactory<SettingsUseCase>(() => SettingsUseCase(di()));

  //* Bloc
  di.registerSingleton(SearchBloc(di()));
  di.registerFactory(() => MyListBloc(di())..add(const MyListEvent.started()));
  di.registerFactory(
      () => PopularAnimeBloc(di())..add(const PopularAnimeEvent.started()));
  di.registerFactory<SettingsBloc>(
      () => SettingsBloc(di())..add(const SettingsEvent.load()));
  di.registerFactory<DetailsBloc>(() => DetailsBloc(di(), di()));
}
