import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class AnimeSearchDetail extends StatelessWidget {
  const AnimeSearchDetail(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100,
        width: 50,
        child: CustomNetworkImage(anime.images.small!),
      ),
      title: Text(anime.title),
    );
  }
}
