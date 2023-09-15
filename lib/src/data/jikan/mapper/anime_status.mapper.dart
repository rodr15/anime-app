import '../../../domain/models/anime.enums.dart';

extension AnimeStatusMap on AnimeStatus {
  static const valueMap = {
    AnimeStatus.emission: 'emission',
    AnimeStatus.finished: 'finished',
    AnimeStatus.unknown: 'unknown'
  };
  String? get value => valueMap[this];

  static AnimeStatus fromString(String input) {
    final reverseValueMap =
        valueMap.map<String, AnimeStatus>((key, value) => MapEntry(value, key));

    AnimeStatus? output = reverseValueMap[input];
    if (output == null) {
      return AnimeStatus.unknown;
    }

    return output;
  }
}
