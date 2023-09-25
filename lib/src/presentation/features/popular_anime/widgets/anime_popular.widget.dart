import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../configuration/routes/routes.dart';
import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class AnimePopularView extends StatelessWidget {
  const AnimePopularView(this.anime, {super.key});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(Routes.popularAnimeDetails, extra: anime),
      child: CustomNetworkImage(
        anime.images.large!,
        boxFit: BoxFit.fill,
      ),
    );
  }
}
