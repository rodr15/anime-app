import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/usecases/anime.usecase.dart';
import 'package:anime/src/presentation/features/popular_anime/controller/popular_anime_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_anime_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AnimeUseCase>()])
void main() {
  late PopularAnimeBloc searchBloc;
  late AnimeUseCase animeUseCase;
  setUp(() {
    animeUseCase = MockAnimeUseCase();
    searchBloc = PopularAnimeBloc(animeUseCase);
  });

  group(' 👀 Search Bloc ->  ', () {
    group('Event Search ->', () {
      blocTest<PopularAnimeBloc, PopularAnimeState>(
        'emits [Loading,Success] when search is added.',
        build: () => searchBloc,
        act: (bloc) => bloc.add(const PopularAnimeEvent.started()),
        expect: () => const <PopularAnimeState>[
          PopularAnimeState.loading(),
          PopularAnimeState.success([]),
        ],
      );
      blocTest<PopularAnimeBloc, PopularAnimeState>(
        'emits [Loading,Error] when search is added.',
        build: () => searchBloc,
        setUp: () {
          when(animeUseCase.getSeasonAnime())
              .thenAnswer((_) => throw RequestException.badRequest());
        },
        act: (bloc) => bloc.add(const PopularAnimeEvent.started()),
        expect: () => <PopularAnimeState>[
          const PopularAnimeState.loading(),
          PopularAnimeState.error(RequestException.badRequest().toString()),
        ],
      );
    });
  });
}
