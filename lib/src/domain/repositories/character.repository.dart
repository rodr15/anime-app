import '../models/character/character.model.dart';

abstract class CharacterRepository {
  /// get the characters of the anime with [id]
  Future<List<Character>> getCharactersByAnimeId(int id);
}
