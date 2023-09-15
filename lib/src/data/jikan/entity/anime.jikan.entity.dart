import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/anime.enums.dart';
import 'anime_genres.jikan.entity.dart';
import 'anime_images.jikan.entity.dart';
import 'anime_streaming.jikan.entity.dart';

part 'anime.jikan.entity.freezed.dart';
part 'anime.jikan.entity.g.dart';

@freezed
class AnimeEntityJikan with _$AnimeEntityJikan {
  factory AnimeEntityJikan({
    @JsonKey(name: 'mal_id') required int id,
    required String title,
    @JsonKey(name: 'synopsis') required String description,
    required AnimeImageEntityJikan images,
    String? trailerUrl,
    required int episodes,
    @JsonKey(name: 'rating') required String ageRating,
    required double score,
    required List<AnimeGenresEntityJikan> genres,
    required List<AnimeStreamingEntityJikan> streaming,
    required AnimeStatus status,
    required AnimeType type,
  }) = _AnimeEntityJikan;

  factory AnimeEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntityJikanFromJson(json);
}
