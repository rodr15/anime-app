import '../models/anime.model.dart';
import '../repositories/anime.repository.dart';

class AnimeUseCase {
  AnimeUseCase(this._animeRepository);
  final AnimeRepository _animeRepository;
  Future<List<Anime>> getAnimesByWord(String word) {
    return _animeRepository.getAnimesByWord(word);
  }

  Future<List<Anime>> getSeasonAnime() {
    return _animeRepository.getAnimesByWord('');
  }
}
