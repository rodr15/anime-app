import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import '../common/anime_image.widget.dart';
import '../common/details_description.widget.dart';

class AnimeDetailsTablet extends StatelessWidget {
  const AnimeDetailsTablet(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    final landscape = Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimeImage(anime.portraitImages.large!),
        ),
        Expanded(child: Description(anime))
      ],
    );

    final portrait = SingleChildScrollView(
      child: Column(
        children: [
          AnimeImage(anime.landscapeImages.large ?? ''),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Description(anime),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.landscape ? landscape : portrait;
      },
    );
  }
}
