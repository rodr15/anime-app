import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/models/anime/models.dart';
import '../../controller/details_bloc.bloc.dart';
import '../common/anime_image.widget.dart';
import '../common/details_description.widget.dart';

class AnimeDetailsMobile extends StatelessWidget {
  const AnimeDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final Anime anime = context.read<DetailsBloc>().anime;
    final landscape = Row(
      children: [
        AnimeImage(anime.portraitImages.large ?? ''),
        const SizedBox(width: 20),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DetailsDescription(anime),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );

    final portrait = SingleChildScrollView(
      child: Column(
        children: [
          AnimeImage(anime.landscapeImages.large ?? ''),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DetailsDescription(anime),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.landscape ? landscape : portrait;
      },
    );
  }
}
