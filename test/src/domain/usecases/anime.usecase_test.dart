import 'package:anime/src/domain/exceptions/request.exception.dart';
import 'package:anime/src/domain/models/anime/models.dart';
import 'package:anime/src/domain/repositories/anime.repository.dart';
import 'package:anime/src/domain/repositories/character.repository.dart';
import 'package:anime/src/domain/usecases/anime.usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime.usecase_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<AnimeRepository>(), MockSpec<CharacterRepository>()])
void main() {
  late AnimeUseCase animeUseCase;
  late AnimeRepository animeRepository;
  late CharacterRepository characterRepository;
  setUp(() {
    animeRepository = MockAnimeRepository();
    characterRepository = MockCharacterRepository();
    animeUseCase = AnimeUseCase(animeRepository, characterRepository);
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
