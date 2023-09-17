import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class PopularAnimeList extends StatelessWidget {
  const PopularAnimeList(this.animes, {super.key});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 0.72,
      children: animes.map((anime) => AnimeView(anime)).toList(),
    );
  }
}

class AnimeView extends StatelessWidget {
  const AnimeView(this.anime, {super.key});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: CustomNetworkImage(anime.images.large!),
    );
  }
}
