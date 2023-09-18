import '../models/anime.model.dart';
import '../repositories/user_list.repository.dart';

class UserListUseCase {
  UserListUseCase(this._userListRepository);
  final UserListRepository _userListRepository;

  Future<List<Anime>> getFavoriteAnimes() async {
    return <Anime>[];
  }
}
