import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../configuration/routes/routes.dart';
import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class AnimeSearchDetail extends StatelessWidget {
  const AnimeSearchDetail(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.goNamed(Routes.popularAnimeDetails, extra: anime),
      leading: SizedBox(
        height: 100,
        width: 50,
        child: CustomNetworkImage(anime.images.small!),
      ),
      title: Text(anime.title),
    );
  }
}
