import 'package:anime/src/domain/models/anime.enums.dart';
import 'package:anime/src/domain/models/anime.model.dart';
import 'package:anime/src/domain/models/anime_genres.model.dart';
import 'package:anime/src/domain/models/anime_images.model.dart';
import 'package:anime/src/domain/models/anime_streaming.model.dart';
import 'package:anime/src/domain/usecases/user_list.usecase.dart';
import 'package:anime/src/presentation/features/details/controller/details_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'details_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserListUseCase>()])
void main() {
  late DetailsBloc detailsBloc;
  late UserListUseCase useCase;

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
    useCase = MockUserListUseCase();
    detailsBloc = DetailsBloc(useCase);
  });

  group(' 👀 Details Bloc ->  ', () {
    group('Event Load', () {
      blocTest<DetailsBloc, DetailsState>(
        'emits [Loading,Success] when load is added. Anime exists',
        build: () => detailsBloc,
        setUp: () {
          when(useCase.animeExists(1)).thenAnswer((_) async => true);
        },
        act: (bloc) => bloc.add(DetailsEvent.load(anime1)),
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
          when(useCase.animeExists(1)).thenAnswer((_) async => false);
        },
        act: (bloc) => bloc.add(DetailsEvent.load(anime1)),
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
          when(useCase.toggleAnimeInFavoriteList(anime1));
        },
        act: (bloc) => bloc.add(DetailsEvent.addAnime(anime1)),
        expect: () => [],
        verify: (bloc) {
          verify(useCase.toggleAnimeInFavoriteList(anime1)).called(1);
        },
      );
    });
  });
}
