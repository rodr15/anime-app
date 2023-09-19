import 'package:isar/isar.dart';

import '../../../../common/extensions/stream.dart';
import '../../../../domain/models/models.dart';
import '../../../../domain/repositories/user_list.repository.dart';
import '../entity/anime.isar.entity.dart';
import '../mapper/anime.isar.entity.mapper.dart';

class UserListIsarRepositoryImpl implements UserListRepository {
  UserListIsarRepositoryImpl(this._isar);

  final Isar _isar;

  @override
  Stream<List<Anime>> listenAnimesFavorite() {
    Query<AnimeEntityIsar> favoritesQuery = _isar.animeEntityIsars.buildQuery();

    return favoritesQuery.watch().mapList((p0) => AnimeMapperIsar.toAnime(p0));
  }

  @override
  Future<List<Anime>> getAnimesFavorite() async {
    final query = _isar.animeEntityIsars.buildQuery();
    final favorites = await query.findAll();
    return favorites.map((e) => AnimeMapperIsar.toAnime(e)).toList();
  }

  @override
  void toggleInAnimeList(Anime anime) async {
    final exists = await _isar.animeEntityIsars
        .filter()
        .titleEqualTo(anime.title)
        .findAll();

    _isar.writeTxn(() async {
      if (exists.isEmpty) {
        await _isar.animeEntityIsars.put(AnimeMapperIsar.toEntity(anime));
      } else {
        List<int> animeIds = exists.map((anime) => anime.isarId).toList();

        await _isar.animeEntityIsars.deleteAll(animeIds);
      }
    });
  }
}
