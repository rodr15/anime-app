import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../domain/models/anime.model.dart';

class ChipsInfo extends StatelessWidget {
  const ChipsInfo({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        runSpacing: 0,
        children: [
          Chip(
            label: Text(
              S.of(context)!.ageRating(anime.ageRating),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Chip(
            label: Text(
              S.of(context)!.episodes(anime.episodes),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Chip(
            label: Text(
              S.of(context)!.score(anime.score),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
