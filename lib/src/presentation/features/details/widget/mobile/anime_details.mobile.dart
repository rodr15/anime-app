import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import '../common/anime_image.widget.dart';
import '../common/details_description.widget.dart';

class AnimeDetailsMobile extends StatelessWidget {
  const AnimeDetailsMobile(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    final landscape = Row(
      children: [
        AnimeImage(anime.portraitImages.large ?? ''),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(child: Description(anime)),
          ),
        ),
        const SizedBox(width: 20),
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
