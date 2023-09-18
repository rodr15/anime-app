import '../../../domain/models/anime_streaming.model.dart';
import '../entity/anime_streaming.isar.entity.dart';

class AnimeStreamingMapperIsar {
  static AnimeStreaming toStreaming(AnimeStreamingEntityIsar streaming) {
    return AnimeStreaming(name: streaming.name!, url: streaming.url!);
  }

  static AnimeStreamingEntityIsar toEntity(AnimeStreaming streaming) {
    return AnimeStreamingEntityIsar(name: streaming.name, url: streaming.url);
  }
}
