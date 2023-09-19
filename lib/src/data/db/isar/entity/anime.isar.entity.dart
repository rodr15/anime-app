// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import '../../../../domain/models/anime.enums.dart';
import 'anime_genres.isar.entity.dart';
import 'anime_image.isar.entity.dart';
import 'anime_streaming.isar.entity.dart';

part 'anime.isar.entity.g.dart';

@collection
class AnimeEntityIsar {
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
  AnimeEntityIsar({
    this.id,
    this.title,
    this.description,
    this.images,
    this.trailerUrl,
    this.episodes,
    this.ageRating,
    this.score,
    this.genres,
    this.streaming,
    this.status,
    this.type,
  });
}
