import '../../../domain/models/anime.model.dart';
import '../../../domain/repositories/user_list.repository.dart';

class UserListIsarRepositoryImpl implements UserListRepository {
  @override
  Future<List<Anime>> getAnimesFavorite() async {
    return [];
  }
}
