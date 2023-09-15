import '../../../domain/models/anime_images.model.dart';
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
