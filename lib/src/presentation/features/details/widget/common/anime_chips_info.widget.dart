import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../domain/models/anime/models.dart';

class ChipsInfo extends StatelessWidget {
  const ChipsInfo({super.key, required this.anime});

  final Anime anime;
  @override
  Widget build(BuildContext context) {
    final chips = [
      S.of(context)!.ageRating(anime.ageRating),
      S.of(context)!.episodes(anime.episodes),
      S.of(context)!.score(anime.score),
    ];
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        runSpacing: 0,
        children: chips
            .map((e) => Chip(
                  label: Text(
                    e,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
