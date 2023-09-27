import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../configuration/routes/routes.dart';
import '../../../../../domain/models/anime/models.dart';
import '../anime_list_tile.widget.dart';

class MyListTabletPortrait extends StatelessWidget {
  const MyListTabletPortrait(this.animes, {super.key});
  final List<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animes.length,
      itemBuilder: (context, index) {
        return AnimeListTile(
          animes[index],
          onTap: (anime) =>
              context.goNamed(Routes.myListDetails, extra: anime!.id),
        );
      },
    );
  }
}
