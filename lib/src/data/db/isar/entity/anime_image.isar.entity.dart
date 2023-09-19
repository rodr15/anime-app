// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'anime_image.isar.entity.g.dart';

@embedded
class AnimeImageEntityIsar {
  int? id;
  String? small;
  String? large;
  String? original;
  AnimeImageEntityIsar({
    this.id,
    this.small,
    this.large,
    this.original,
  });
}
