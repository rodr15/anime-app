import '../../../../domain/models/character/character.model.dart';
import '../entity/character.jikan.entity.dart';

class CharacterMapperJikan {
  static Character toCharacter(CharacterEntityJikan character) {
    return Character(
      id: character.id,
      name: character.name,
      imageUrl: character.imageUrl,
    );
  }
}
