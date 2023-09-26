import '../../../../domain/models/anime/models.dart';
import '../entity/anime_streaming.jikan.entity.dart';

class AnimeStreamingMapperJikan {
  static AnimeStreaming toStreaming(AnimeStreamingEntityJikan streaming) {
    return AnimeStreaming(name: streaming.name, url: streaming.url);
  }
}
