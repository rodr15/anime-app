import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_genres.jikan.entity.freezed.dart';
part 'anime_genres.jikan.entity.g.dart';

@freezed
class AnimeGenresEntityJikan with _$AnimeGenresEntityJikan {
  factory AnimeGenresEntityJikan({
    @JsonKey(name: 'mal_id') required int id,
    required String name,
  }) = _AnimeGenresEntityJikan;

  factory AnimeGenresEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$AnimeGenresEntityJikanFromJson(json);
}
