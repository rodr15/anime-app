// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'anime_streaming.isar.entity.g.dart';

@embedded
class AnimeStreamingEntityIsar {
  int? id;
  String? name;
  String? url;
  AnimeStreamingEntityIsar({
    this.id,
    this.name,
    this.url,
  });
}
