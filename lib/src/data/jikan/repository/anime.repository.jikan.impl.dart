import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/models/anime.model.dart';
import '../../../domain/repositories/anime.repository.dart';
import '../entity/anime.jikan.entity.dart';
import '../mapper/anime.jikan.entity.mapper.dart';

class AnimeRepositoryJikanImpl implements AnimeRepository {
  @override
  Future<List<Anime>> getAnimesByWord(String word) async {
    const authority = 'api.jikan.moe';
    const path = '/v4/anime';
    final params = {'q': word};
    final uri = Uri.https(authority, path, params);

    print(uri);
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) throw Exception(response.statusCode);

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List data = jsonData['data'];

      return data
          .map((animeJson) =>
              AnimeMapperJikan.toAnime(AnimeEntityJikan.fromJson(animeJson)))
          .toList();
    } catch (e) {
      //TODO: Throw Exception
      print('Error de solicitud: $e');

      return [];
    }
  }
}
