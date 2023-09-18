import '../models/anime.model.dart';
import '../repositories/user_list.repository.dart';

class UserListUseCase {
  UserListUseCase(this._userListRepository);
  final UserListRepository _userListRepository;

  Stream<List<Anime>> listenFavoriteAnimes() {
    return _userListRepository.listenAnimesFavorite();
  }

  Future<List<Anime>> getFavoriteAnimes() {
    return _userListRepository.getAnimesFavorite();
  }

  void saveAnimeFavorite(Anime anime) {
    return _userListRepository.toggleInAnimeList(anime);
  }
}
