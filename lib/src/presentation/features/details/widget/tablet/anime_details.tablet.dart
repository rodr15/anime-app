import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import '../anime_actions.widget.dart';
import '../anime_chips_info.widget.dart';
import '../anime_image.widget.dart';

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
        Expanded(child: _Description(anime: anime))
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
  const _Description({required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
      child: Column(
        children: [
          Text(
            anime.title,
            style: Theme.of(context).textTheme.headlineLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 50),
          ChipsInfo(anime: anime),
          const SizedBox(height: 20),
          AnimeActions(anime: anime),
          const SizedBox(height: 50),
          Text(
            anime.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
