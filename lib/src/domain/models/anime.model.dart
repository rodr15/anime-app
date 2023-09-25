import 'package:freezed_annotation/freezed_annotation.dart';

import 'anime.enums.dart';
import 'anime_genres.model.dart';
import 'anime_images.model.dart';
import 'anime_streaming.model.dart';

part 'anime.model.freezed.dart';

@freezed
class Anime with _$Anime {
  factory Anime({
    required int id,
    required String title,
    required String description,
    required AnimeImages portraitImages,
    required AnimeImages landscapeImages,
    String? trailerUrl,
    required int episodes,
    required String ageRating,
    required double score,
    required List<AnimeGenres> genres,
    required List<AnimeStreaming> streaming,
    required AnimeStatus status,
    required AnimeType type,
  }) = _Anime;
}
