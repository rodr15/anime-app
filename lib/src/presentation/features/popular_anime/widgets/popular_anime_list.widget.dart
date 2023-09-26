import 'package:flutter/material.dart';

import '../../../../common/extensions/responsive.dart';
import '../../../../domain/models/anime/models.dart';
import 'anime_popular.widget.dart';

class PopularAnimeList extends StatelessWidget {
  const PopularAnimeList(this.animes, {super.key});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    final crossCount = context.responsive(2, sm: 2, md: 3, lg: 4, xl: 4);

    return GridView.count(
      crossAxisCount: crossCount,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 0.7,
      children: animes.map((anime) => AnimePopularView(anime)).toList(),
    );
  }
}
