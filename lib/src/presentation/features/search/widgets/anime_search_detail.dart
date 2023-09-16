import 'package:flutter/material.dart';

import '../../../../domain/models/anime.model.dart';

class AnimeSearchDetail extends StatelessWidget {
  const AnimeSearchDetail(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100,
        width: 50,
        child: Image.network(
          anime.images.small!,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/image_not_found.jpg');
          },
        ),
      ),
      title: Text(anime.title),
    );
  }
}
