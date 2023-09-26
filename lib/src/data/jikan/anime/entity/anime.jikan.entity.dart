import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime/models.dart';
import '../mapper/anime_status.mapper.dart';
import '../mapper/anime_type.mapper.dart';
import 'anime_genres.jikan.entity.dart';
import 'anime_images.jikan.entity.dart';
import 'anime_streaming.jikan.entity.dart';

part 'anime.jikan.entity.freezed.dart';
part 'anime.jikan.entity.g.dart';

Object? portrait(json, field) => json['images']['jpg'];

Object? landscape(json, field) => json['trailer']['images'];

@freezed
class AnimeEntityJikan with _$AnimeEntityJikan {
  factory AnimeEntityJikan({
    @JsonKey(name: 'mal_id') required int id,
    @Default('') String? title,
    @JsonKey(name: 'synopsis', defaultValue: '') String? description,
    @JsonKey(name: 'trailer', readValue: landscape)
    AnimeImageEntityJikan? landscapeImages,
    @JsonKey(name: 'images', readValue: portrait)
    AnimeImageEntityJikan? portraitImages,
    String? trailerUrl,
    @Default(0) int? episodes,
    @JsonKey(name: 'rating', defaultValue: '') String? ageRating,
    @Default(0.0) double? score,
    List<AnimeGenresEntityJikan>? genres,
    List<AnimeStreamingEntityJikan>? streaming,
    @JsonKey(fromJson: AnimeStatusMap.fromString) required AnimeStatus status,
    @JsonKey(fromJson: AnimeTypeMap.fromString) required AnimeType type,
  }) = _AnimeEntityJikan;

  factory AnimeEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntityJikanFromJson(json);
}
