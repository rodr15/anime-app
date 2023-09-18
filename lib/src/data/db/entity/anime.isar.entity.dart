import 'package:isar/isar.dart';

import '../../../domain/models/anime.enums.dart';
import 'anime_genres.isar.entity.dart';
import 'anime_image.isar.entity.dart';
import 'anime_streaming.isar.entity.dart';

part 'anime.isar.entity.g.dart';

@collection
class AnimeEntityHive {
  Id isarId = Isar.autoIncrement;

  int? id;
  String? title;
  String? description;
  AnimeImageEntityIsar? images;
  String? trailerUrl;
  int? episodes;
  String? ageRating;
  double? score;
  List<AnimeGenresEntityIsar>? genres;
  List<AnimeStreamingEntityIsar>? streaming;
  @Enumerated(EnumType.name)
  AnimeStatus? status;
  @Enumerated(EnumType.name)
  AnimeType? type;
}
