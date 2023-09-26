import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import '../anime_actions.widget.dart';
import '../anime_chips_info.widget.dart';
import '../anime_image.widget.dart';

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
            child: SingleChildScrollView(child: _Description(anime: anime)),
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
            child: _Description(anime: anime),
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

class _Description extends StatelessWidget {
  const _Description({
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          anime.title,
          style: Theme.of(context).textTheme.titleLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),
        ChipsInfo(anime: anime),
        const SizedBox(height: 20),
        AnimeActions(anime: anime),
        const SizedBox(height: 20),
        Text(
          anime.description,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
