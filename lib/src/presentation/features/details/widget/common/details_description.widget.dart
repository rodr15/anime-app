import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import 'anime_actions.widget.dart';
import 'anime_chips_info.widget.dart';

class Description extends StatelessWidget {
  const Description(this.anime, {super.key});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          anime.title,
          style: Theme.of(context).textTheme.titleLarge,
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
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
