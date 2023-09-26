import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/models/anime/models.dart';
import 'package:anime/src/domain/repositories/user_list.repository.dart';
import 'package:anime/src/domain/usecases/user_list.usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_list.usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserListRepository>()])
void main() {
  late UserListUseCase userListUseCase;
  late UserListRepository listRepository;

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

  final anime2 = Anime(
    id: 2,
    title: 'Ejemplo Anime 2',
    description: 'Descripción del Anime 2',
    portraitImages: const AnimeImages(),
    landscapeImages: const AnimeImages(),
    trailerUrl: 'https://www.youtube.com/watch?v=abc123',
    episodes: 24,
    ageRating: 'R',
    score: 9.0,
    genres: [genreDrama],
    streaming: [streamingNetfilx],
    status: AnimeStatus.emission,
    type: AnimeType.manga,
  );

  setUp(() {
    listRepository = MockUserListRepository();
    userListUseCase = UserListUseCase(listRepository);
  });

  group('👤 USer List Use Case ->', () {
    group('listenFavoritesAnimes ->', () {
      test('[Return] animes', () {
        final testAnimes = [anime1, anime2];
        when(listRepository.listenAnimesFavorite())
            .thenAnswer((_) => Stream.value(testAnimes));
        userListUseCase.listenFavoriteAnimes().listen((event) {
          expect(event, testAnimes);
        });
      });
    });
    group('getFavoriteAnimes ->', () {
      test('[Return] animes', () async {
        final testAnimes = [anime1, anime2];
        when(listRepository.getAnimesFavorite())
            .thenAnswer((_) async => testAnimes);

        final animes = await userListUseCase.getFavoriteAnimes();

        expect(animes, testAnimes);
      });
      test('[Throw] error', () async {
        when(listRepository.getAnimesFavorite())
            .thenAnswer((_) async => throw RequestException.badRequest());

        expect(() async => await userListUseCase.getFavoriteAnimes(),
            throwsException);
      });
    });

    group('toggleAnimeInFavoriteList ->', () {
      test('[void]', () async {
        userListUseCase.toggleAnimeInFavoriteList(anime1);

        verify(listRepository.toggleInAnimeList(anime1)).called(1);
      });
    });

    group('animeExists ->', () {
      test('return true', () async {
        int id = 1;
        when(listRepository.animeExists(id)).thenAnswer((_) async => true);

        final bool exist = await userListUseCase.animeExists(id);

        expect(exist, true);
        verify(listRepository.animeExists(id)).called(1);
        verifyNoMoreInteractions(listRepository);
      });
      test('return true', () async {
        int id = 1;
        when(listRepository.animeExists(id)).thenAnswer((_) async => false);

        final bool exist = await userListUseCase.animeExists(id);

        expect(exist, false);
        verify(listRepository.animeExists(id)).called(1);
        verifyNoMoreInteractions(listRepository);
      });
    });
  });
}
