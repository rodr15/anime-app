import '../models/anime.model.dart';

abstract interface class UserListRepository {
  /// Retrieves a stream of list of anime objects
  Stream<List<Anime>> getAnimesFavorite();

  /// Save or delete [anime] on Favorites List depending if it exists
  void toggleInAnimeList(Anime anime);
}
