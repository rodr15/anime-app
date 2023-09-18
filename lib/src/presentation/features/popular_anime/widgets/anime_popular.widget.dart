import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../common/widgets/network_image.widget.dart';
import '../controller/popular_anime_bloc.bloc.dart';

class AnimePopularView extends StatelessWidget {
  const AnimePopularView(this.anime, {super.key});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.deepPurpleAccent),
      ),
      margin: const EdgeInsets.all(3),
      child: Column(
        children: [
          CustomNetworkImage(anime.images.large!),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.deepPurpleAccent),
            ),
            child: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  context
                      .read<PopularAnimeBloc>()
                      .add(PopularAnimeEvent.addFavorite(anime));
                }),
          )
        ],
      ),
    );
  }
}
