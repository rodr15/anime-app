import '../../../../../domain/models/anime/models.dart';
import '../entity/anime.isar.entity.dart';
import 'anime_genres.isar.mapper.dart';
import 'anime_images.isar.mapper.dart';
import 'anime_streaming.isar.mapper.dart';

class AnimeMapperIsar {
  static Anime toAnime(AnimeEntityIsar animeEntity) {
    return Anime(
      id: animeEntity.id!,
      title: animeEntity.title ?? '',
      description: animeEntity.description ?? '',
      portraitImages:
          AnimeImagesMapperIsar.toAnimeImages(animeEntity.portraitImages!),
      landscapeImages:
          AnimeImagesMapperIsar.toAnimeImages(animeEntity.landscapeImages!),
      episodes: animeEntity.episodes ?? 0,
      ageRating: animeEntity.ageRating ?? '',
      score: animeEntity.score ?? 0.0,
      genres: animeEntity.genres != null
          ? animeEntity.genres!
              .map((e) => AnimeGenresMapperIsar.toAnimeGenres(e))
              .toList()
          : [],
      streaming: animeEntity.streaming != null
          ? animeEntity.streaming!
              .map((e) => AnimeStreamingMapperIsar.toStreaming(e))
              .toList()
          : [],
      status: animeEntity.status!,
      type: animeEntity.type!,
    );
  }

  static AnimeEntityIsar toEntity(Anime anime) {
    return AnimeEntityIsar(
      id: anime.id,
      title: anime.title,
      description: anime.description,
      portraitImages: AnimeImagesMapperIsar.toEntity(anime.portraitImages),
      landscapeImages: AnimeImagesMapperIsar.toEntity(anime.landscapeImages),
      trailerUrl: anime.trailerUrl,
      episodes: anime.episodes,
      ageRating: anime.ageRating,
      score: anime.score,
      genres:
          anime.genres.map((e) => AnimeGenresMapperIsar.toEntity(e)).toList(),
      streaming: anime.streaming
          .map((e) => AnimeStreamingMapperIsar.toEntity(e))
          .toList(),
      status: anime.status,
      type: anime.type,
    );
  }
}
