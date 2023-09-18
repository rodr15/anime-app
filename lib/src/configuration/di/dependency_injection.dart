import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/db/entity/anime.isar.entity.dart';
import '../../data/db/repository/user_list.repository.isar.impl.dart';
import '../../data/jikan/repository/anime.repository.jikan.impl.dart';
import '../../domain/repositories/anime.repository.dart';
import '../../domain/repositories/user_list.repository.dart';
import '../../domain/usecases/anime.usecase.dart';
import '../../domain/usecases/user_list.usecase.dart';
import '../../presentation/features/my-list/controller/my_list_bloc.bloc.dart';
import '../../presentation/features/popular_anime/controller/popular_anime_bloc.bloc.dart';
import '../../presentation/features/search/controller/search_bloc.bloc.dart';

final GetIt di = GetIt.instance;

/// Set up all project dependencies
Future<void> setupDependencies() async {
  //* DB
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AnimeEntityIsarSchema],
    directory: dir.path,
  );

  di.registerSingleton<Isar>(isar);

  //* Repository
  di.registerSingleton<AnimeRepository>(AnimeRepositoryJikanImpl());
  di.registerSingleton<UserListRepository>(UserListIsarRepositoryImpl(di()));

  //* UseCase
  di.registerFactory<AnimeUseCase>(() => AnimeUseCase(di()));
  di.registerFactory<UserListUseCase>(() => UserListUseCase(di()));

  //* Bloc
  di.registerFactory(() => SearchBloc(di()));
  di.registerFactory(() => MyListBloc(di())..add(const MyListEvent.started()));
  di.registerFactory(() =>
      PopularAnimeBloc(di(), di())..add(const PopularAnimeEvent.started()));
}
