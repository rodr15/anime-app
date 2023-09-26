import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_images.jikan.entity.freezed.dart';
part 'anime_images.jikan.entity.g.dart';

@freezed
class AnimeImageEntityJikan with _$AnimeImageEntityJikan {
  factory AnimeImageEntityJikan({
    @JsonKey(name: 'small_image_url') String? small,
    @JsonKey(name: 'large_image_url') String? large,
    @JsonKey(name: 'image_url') String? original,
  }) = _AnimeImageEntityJikan;

  factory AnimeImageEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageEntityJikanFromJson(json);
}
