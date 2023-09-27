import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.model.freezed.dart';

@freezed
class Character with _$Character {
  factory Character({
    required int id,
    String? imageUrl,
    required String name,
  }) = _Character;
}
