import '../models/anime.model.dart';

abstract interface class AnimeRepository {
  /// Retrieves a list of anime objects based on a search [word].
  Future<List<Anime>> getAnimesByWord(String word);
}
