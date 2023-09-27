import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../common/helpers/get_request.exception.dart';
import '../../../../domain/exceptions/request.exception.dart';
import '../../../../domain/models/character/character.model.dart';
import '../../../../domain/repositories/character.repository.dart';
import '../entity/character.jikan.entity.dart';
import '../mapper/character.mapper.jikan.dart';

class CharacterRepositoryJikanImpl implements CharacterRepository {
  @override
  Future<List<Character>> getCharactersByAnimeId(int id) async {
    const authority = 'api.jikan.moe';
    final path = '/v4/anime/$id/characters';

    final uri = Uri.https(authority, path);
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        getException(response.statusCode);
      }
      final Map<String, dynamic> jsonData = json.decode(response.body);

      final List data = jsonData['data'] ?? [];

      return data
          .map((characterJson) => CharacterMapperJikan.toCharacter(
              CharacterEntityJikan.fromJson(characterJson['character'])))
          .toList();
    } on RequestException catch (e) {
      Logger().e(e);
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw RequestException.unknown();
    }
  }
}
