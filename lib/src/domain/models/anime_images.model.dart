import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_images.model.freezed.dart';

@freezed
abstract class AnimeImages with _$AnimeImages {
  const factory AnimeImages({
    String? small,
    String? large,
    String? original,
  }) = _AnimeImages;
}
