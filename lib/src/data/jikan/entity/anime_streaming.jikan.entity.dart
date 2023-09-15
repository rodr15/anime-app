import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_streaming.jikan.entity.freezed.dart';
part 'anime_streaming.jikan.entity.g.dart';

@freezed
class AnimeStreamingEntityJikan with _$AnimeStreamingEntityJikan {
  factory AnimeStreamingEntityJikan({
    required String name,
    required String url,
  }) = _AnimeStreamingEntityJikan;

  factory AnimeStreamingEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$AnimeStreamingEntityJikanFromJson(json);
}
