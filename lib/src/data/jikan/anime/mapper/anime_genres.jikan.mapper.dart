import '../../../../domain/models/anime/models.dart';
import '../entity/anime_genres.jikan.entity.dart';

class AnimeGenresJikanMapper {
  static AnimeGenres toAnimeGenres(AnimeGenresEntityJikan genre) {
    return AnimeGenres(id: genre.id, name: genre.name);
  }
}
