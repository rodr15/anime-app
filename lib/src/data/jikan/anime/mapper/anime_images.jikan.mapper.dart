import '../../../../domain/models/anime/models.dart';
import '../entity/anime_images.jikan.entity.dart';

class AnimeImagesMapperJikan {
  static AnimeImages toAnimeImages(AnimeImageEntityJikan image) {
    return AnimeImages(
      small: image.small,
      large: image.large,
      original: image.original,
    );
  }
}
