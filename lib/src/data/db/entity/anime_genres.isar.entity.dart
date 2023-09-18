// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'anime_genres.isar.entity.g.dart';

@embedded
class AnimeGenresEntityIsar {
  int? id;
  String? name;
  AnimeGenresEntityIsar({
    this.id,
    this.name,
  });
}
