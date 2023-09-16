import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/helpers/get_request.exception.dart';
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
    // try {
    final response = await http.get(uri);
    print('status:${response.statusCode}');
    if (response.statusCode != 200) {
      getException(response.statusCode);
    }
    final Map<String, dynamic> jsonData = json.decode(response.body);

    final List data = jsonData['data'] ?? [];

    return data
        .map((animeJson) =>
            AnimeMapperJikan.toAnime(AnimeEntityJikan.fromJson(animeJson)))
        .toList();
    // } on RequestException catch (e) {
    //   Logger().e(e);
    //   rethrow;
    // } catch (e) {
    //   Logger().e(e);
    //   throw RequestException.unknown();
    // }
  }
}
