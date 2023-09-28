import 'package:anime/src/domain/models/anime/models.dart';
import 'package:anime/src/domain/usecases/anime.usecase.dart';
import 'package:anime/src/domain/usecases/user_list.usecase.dart';
import 'package:anime/src/presentation/features/details/controller/details_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'details_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserListUseCase>(), MockSpec<AnimeUseCase>()])
void main() {
  late DetailsBloc detailsBloc;
  late UserListUseCase listUseCase;
  late AnimeUseCase animeUseCase;

  const genreDrama = AnimeGenres(id: 1, name: 'Drama');
  const genreAction = AnimeGenres(id: 2, name: 'Action');

  final streamingCrunchy = AnimeStreaming(
      name: 'Crunchyroll', url: 'https://www.crunchyroll.com/anime1');
  final streamingNetfilx =
      AnimeStreaming(name: 'Netflix', url: 'https://www.netflix.com/anime1');

  final Anime anime1 = Anime(
    id: 1,
    title: 'Ejemplo Anime 1',
    description: 'Descripción del Anime 1',
    portraitImages: const AnimeImages(),
    landscapeImages: const AnimeImages(),
    episodes: 12,
    ageRating: 'PG-13',
    score: 8.5,
    genres: [genreDrama, genreAction],
    streaming: [streamingCrunchy, streamingNetfilx],
    status: AnimeStatus.emission,
    type: AnimeType.anime,
  );

  setUp(() {
    listUseCase = MockUserListUseCase();
    animeUseCase = MockAnimeUseCase();
    detailsBloc = DetailsBloc(listUseCase, animeUseCase);
  });

  group(' 👀 Details Bloc ->  ', () {
    group('Event Load', () {
      blocTest<DetailsBloc, DetailsState>(
        'emits [Loading,Success] when load is added. Anime exists',
        build: () => detailsBloc,
        setUp: () {
          when(listUseCase.animeExists(anime1.id))
              .thenAnswer((_) async => true);
          when(animeUseCase.getAnimeById(anime1.id))
              .thenAnswer((_) async => anime1);
        },
        act: (bloc) => bloc.add(DetailsEvent.load(anime1.id)),
        expect: () => [
          const DetailsState.loading(),
          const DetailsState.loaded(),
        ],
        verify: (bloc) {
          expect(detailsBloc.anime, anime1);
          expect(detailsBloc.animeExists, true);
        },
      );

      blocTest<DetailsBloc, DetailsState>(
        'emits [Loading,Success] when load is added. Anime not exists',
        build: () => detailsBloc,
        setUp: () {
          when(listUseCase.animeExists(anime1.id))
              .thenAnswer((_) async => false);
          when(animeUseCase.getAnimeById(anime1.id))
              .thenAnswer((_) async => anime1);
        },
        act: (bloc) => bloc.add(DetailsEvent.load(anime1.id)),
        expect: () => [
          const DetailsState.loading(),
          const DetailsState.loaded(),
        ],
        verify: (bloc) {
          expect(detailsBloc.anime, anime1);
          expect(detailsBloc.animeExists, false);
        },
      );
    });

    group('Event Add Anime', () {
      blocTest<DetailsBloc, DetailsState>(
        'emits [Loading,Success] when addAnime is added.',
        build: () => detailsBloc,
        setUp: () {
          when(listUseCase.toggleAnimeInFavoriteList(anime1));
        },
        act: (bloc) => bloc.add(DetailsEvent.addAnime(anime1)),
        expect: () => [],
        verify: (bloc) {
          verify(listUseCase.toggleAnimeInFavoriteList(anime1)).called(1);
        },
      );
    });
  });
}
