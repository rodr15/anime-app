import '../../../domain/models/anime.enums.dart';

extension AnimeTypeMap on AnimeType {
  static const valueMap = {
    AnimeType.tv: 'tv',
    AnimeType.anime: 'anime',
    AnimeType.manga: 'manga',
    AnimeType.movie: 'movie',
    AnimeType.unknown: 'unknown'
  };
  String? get value => valueMap[this];

  static AnimeType fromString(String input) {
    final reverseValueMap =
        valueMap.map<String, AnimeType>((key, value) => MapEntry(value, key));

    AnimeType? output = reverseValueMap[input];
    if (output == null) {
      return AnimeType.unknown;
    }

    return output;
  }
}
