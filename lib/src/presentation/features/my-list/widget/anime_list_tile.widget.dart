import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(1, 2),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 100,
      child: Row(
        children: [
          CustomNetworkImage(anime.images.small!),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              anime.title,
              softWrap: false,
              maxLines: 2,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_right_sharp)
        ],
      ),
    );
  }
}
