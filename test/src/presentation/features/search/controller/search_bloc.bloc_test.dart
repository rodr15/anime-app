import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/usecases/anime.usecase.dart';
import 'package:anime/src/presentation/features/search/controller/search_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AnimeUseCase>()])
void main() {
  late SearchBloc searchBloc;
  late AnimeUseCase animeUseCase;
  setUp(() {
    animeUseCase = MockAnimeUseCase();
    searchBloc = SearchBloc(animeUseCase);
  });

  group(' 👀 Search Bloc ->  ', () {
    group('Event Search ->', () {
      blocTest<SearchBloc, SearchState>(
        'emits [Loading,Success] when search is added.',
        build: () => searchBloc,
        act: (bloc) => bloc.add(const SearchEvent.search('search')),
        expect: () => const <SearchState>[
          SearchState.loading(),
          SearchState.success([]),
        ],
      );
      blocTest<SearchBloc, SearchState>(
        'emits [Loading,Error] when search is added.',
        build: () => searchBloc,
        setUp: () {
          when(animeUseCase.getAnimesByWord('search'))
              .thenAnswer((_) => throw RequestException.badRequest());
        },
        act: (bloc) => bloc.add(const SearchEvent.search('search')),
        expect: () => <SearchState>[
          const SearchState.loading(),
          SearchState.error(RequestException.badRequest().toString()),
        ],
      );
    });
  });
}
