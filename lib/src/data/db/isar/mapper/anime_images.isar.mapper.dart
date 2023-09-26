import '../../../../domain/models/anime/models.dart';
import '../entity/anime_image.isar.entity.dart';

class AnimeImagesMapperIsar {
  static AnimeImages toAnimeImages(AnimeImageEntityIsar image) {
    return AnimeImages(
      small: image.small,
      large: image.large,
      original: image.original,
    );
  }

  static AnimeImageEntityIsar toEntity(AnimeImages image) {
    return AnimeImageEntityIsar(
      small: image.small,
      large: image.large,
      original: image.original,
    );
  }
}
