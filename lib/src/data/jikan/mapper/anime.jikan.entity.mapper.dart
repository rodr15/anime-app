import '../../../domain/models/anime.model.dart';
import '../entity/anime.jikan.entity.dart';
import 'anime_genres.jikan.mapper.dart';
import 'anime_images.jikan.mapper.dart';
import 'anime_streaming.jikan.mapper.dart';

class AnimeMapperJikan {
  static Anime toAnime(AnimeEntityJikan animeEntityJikan) {
    return Anime(
      id: animeEntityJikan.id,
      title: animeEntityJikan.title ?? '',
      description: animeEntityJikan.description ?? '',
      images: AnimeImagesMapperJikan.toAnimeImages(animeEntityJikan.images),
      episodes: animeEntityJikan.episodes ?? 0,
      ageRating: animeEntityJikan.ageRating ?? '',
      score: animeEntityJikan.score ?? 0.0,
      genres: animeEntityJikan.genres != null
          ? animeEntityJikan.genres!
              .map((e) => AnimeGenresJikanMapper.toAnimeGenres(e))
              .toList()
          : [],
      streaming: animeEntityJikan.streaming != null
          ? animeEntityJikan.streaming!
              .map((e) => AnimeStreamingMapperJikan.toStreaming(e))
              .toList()
          : [],
      status: animeEntityJikan.status,
      type: animeEntityJikan.type,
    );
  }
}
