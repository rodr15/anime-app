import 'package:get_it/get_it.dart';

import '../../data/jikan/repository/anime.repository.jikan.impl.dart';
import '../../domain/repositories/anime.repository.dart';
import '../../domain/usecases/anime.usecase.dart';
import '../../presentation/features/popular_anime/controller/popular_anime_bloc.bloc.dart';
import '../../presentation/features/search/controller/search_bloc.bloc.dart';

final GetIt di = GetIt.instance;

/// Set up all project dependencies
Future<void> setupDependencies() async {
  //* Repository
  di.registerSingleton<AnimeRepository>(AnimeRepositoryJikanImpl());

  //* UseCase
  di.registerFactory<AnimeUseCase>(() => AnimeUseCase(di()));

  //* Bloc
  di.registerFactory(() => SearchBloc(di())..add(const SearchEvent.started()));
  di.registerFactory(
      () => PopularAnimeBloc(di())..add(const PopularAnimeEvent.started()));
}
