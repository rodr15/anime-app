import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.jikan.entity.freezed.dart';
part 'character.jikan.entity.g.dart';

Object? image(json, field) => json['images']['jpg']['image_url'];

@freezed
class CharacterEntityJikan with _$CharacterEntityJikan {
  factory CharacterEntityJikan({
    @JsonKey(name: 'mal_id') required int id,
    @JsonKey(name: 'images', readValue: image) String? imageUrl,
    required String name,
  }) = _CharacterEntityJikan;

  factory CharacterEntityJikan.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityJikanFromJson(json);
}
