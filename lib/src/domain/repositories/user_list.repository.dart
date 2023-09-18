import '../models/anime.model.dart';

abstract interface class UserListRepository {
  /// Retrieves a list of anime objects
  Future<List<Anime>> getAnimesFavorite();
}
