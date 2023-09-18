import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class AnimeListWidget extends StatelessWidget {
  const AnimeListWidget(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: CustomNetworkImage(anime.images.small!),
    );
  }
}
