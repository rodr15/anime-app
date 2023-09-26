import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/models/anime/models.dart';
import 'package:anime/src/domain/repositories/anime.repository.dart';
import 'package:anime/src/domain/usecases/anime.usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime.usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AnimeRepository>()])
void main() {
  late AnimeUseCase animeUseCase;
  late AnimeRepository animeRepository;
  setUp(() {
    animeRepository = MockAnimeRepository();
    animeUseCase = AnimeUseCase(animeRepository);
  });

  group('👤 AnimeUseCase ->', () {
    group('getAnimeByWord -> ', () {
      test('[Throw] Exception', () {
        when(animeRepository.getAnimesByWord(''))
            .thenAnswer((_) async => throw RequestException.badRequest());

        expect(() => animeUseCase.getAnimesByWord(''), throwsException);
      });
      test('[Return] animes', () async {
        when(animeRepository.getAnimesByWord(''))
            .thenAnswer((_) async => <Anime>[]);

        final animes = await animeUseCase.getAnimesByWord('');

        expect(animes, []);
        expect(animes.runtimeType, List<Anime>);
      });
    });
    group('getSeasonAnime -> ', () {
      test('[Throw] Exception', () {
        when(animeRepository.getSeasonPopularAnime())
            .thenAnswer((_) async => throw RequestException.badRequest());

        expect(() => animeUseCase.getSeasonAnime(), throwsException);
      });
      test('[Return] animes', () async {
        when(animeRepository.getSeasonPopularAnime())
            .thenAnswer((_) async => <Anime>[]);

        final animes = await animeUseCase.getSeasonAnime();

        expect(animes, []);
        expect(animes.runtimeType, List<Anime>);
      });
    });
  });
}
