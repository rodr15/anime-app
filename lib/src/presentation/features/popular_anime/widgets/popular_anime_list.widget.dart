import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';
import 'anime_popular.widget.dart';

class PopularAnimeList extends StatelessWidget {
  const PopularAnimeList(this.animes, {super.key});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 0.7,
      children: animes.map((anime) => AnimePopularView(anime)).toList(),
    );
  }
}
