import '../../../../domain/models/models.dart';
import '../entity/anime_genres.isar.entity.dart';

class AnimeGenresMapperIsar {
  static AnimeGenres toAnimeGenres(AnimeGenresEntityIsar genre) {
    return AnimeGenres(id: genre.id!, name: genre.name!);
  }

  static AnimeGenresEntityIsar toEntity(AnimeGenres genre) {
    return AnimeGenresEntityIsar(id: genre.id, name: genre.name);
  }
}
