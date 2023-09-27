import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../common/helpers/get_request.exception.dart';
import '../../../../domain/exceptions/request.exception.dart';
import '../../../../domain/models/anime/models.dart';
import '../../../../domain/repositories/anime.repository.dart';
import '../entity/anime.jikan.entity.dart';
import '../mapper/anime.jikan.entity.mapper.dart';

class AnimeRepositoryJikanImpl implements AnimeRepository {
  @override
  Future<List<Anime>> getAnimesByWord(String word) async {
    const authority = 'api.jikan.moe';
    const path = '/v4/anime';
    final params = {'q': word};
    final uri = Uri.https(authority, path, params);
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        getException(response.statusCode);
      }
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List data = jsonData['data'] ?? [];

      return data
          .map((animeJson) =>
              AnimeMapperJikan.toAnime(AnimeEntityJikan.fromJson(animeJson)))
          .toList();
    } on RequestException catch (e) {
      Logger().e(e);
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw RequestException.unknown();
    }
  }

  @override
  Future<List<Anime>> getSeasonPopularAnime() async {
    const authority = 'api.jikan.moe';
    const path = '/v4/seasons/now';
    final uri = Uri.https(authority, path);
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        getException(response.statusCode);
      }
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List data = jsonData['data'] ?? [];

      return data
          .map((animeJson) =>
              AnimeMapperJikan.toAnime(AnimeEntityJikan.fromJson(animeJson)))
          .toList();
    } on RequestException catch (e) {
      Logger().e(e);
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw RequestException.unknown();
    }
  }

  @override
  Future<Anime> getAnimeById(int id) async {
    const authority = 'api.jikan.moe';
    final path = '/v4/anime/$id';

    final uri = Uri.https(authority, path);
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        getException(response.statusCode);
      }
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final data = jsonData['data'];

      return AnimeMapperJikan.toAnime(AnimeEntityJikan.fromJson(data));
    } on RequestException catch (e) {
      Logger().e(e);
      rethrow;
    } catch (e) {
      Logger().e(e);
      throw RequestException.unknown();
    }
  }
}
