import '../models/anime/models.dart';

abstract interface class AnimeRepository {
  /// Retrieves a list of anime objects based on a search [word].
  Future<List<Anime>> getAnimesByWord(String word);

  /// Retrieves a list of season popular anime.
  Future<List<Anime>> getSeasonPopularAnime();
}
