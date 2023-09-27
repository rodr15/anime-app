import '../models/anime/models.dart';
import '../repositories/anime.repository.dart';
import '../repositories/character.repository.dart';

class AnimeUseCase {
  AnimeUseCase(this._animeRepository, this._characterRepository);
  final AnimeRepository _animeRepository;
  final CharacterRepository _characterRepository;
  Future<List<Anime>> getAnimesByWord(String word) {
    return _animeRepository.getAnimesByWord(word);
  }

  Future<List<Anime>> getSeasonAnime() {
    return _animeRepository.getSeasonPopularAnime();
  }

  Future<Anime> getAnimeById(int id) async {
    final anime = await _animeRepository.getAnimeById(id);
    final characters = await _characterRepository.getCharactersByAnimeId(id);

    return anime.copyWith(characters: characters);
  }
}
