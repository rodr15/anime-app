import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_genres.model.freezed.dart';

@freezed
abstract class AnimeGenres with _$AnimeGenres {
  const factory AnimeGenres({
    required int id,
    required String name,
  }) = _AnimeGenres;
}
