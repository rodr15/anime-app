import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/models/anime/models.dart';
import '../../controller/details_bloc.bloc.dart';
import '../common/anime_image.widget.dart';
import '../common/details_description.widget.dart';

class AnimeDetailsTablet extends StatelessWidget {
  const AnimeDetailsTablet({super.key});
  @override
  Widget build(BuildContext context) {
    final Anime anime = context.read<DetailsBloc>().anime;
    final landscape = Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimeImage(anime.portraitImages.large!),
        ),
        Expanded(child: SingleChildScrollView(child: DetailsDescription(anime)))
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
