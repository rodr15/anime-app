import 'package:flutter/material.dart';

import '../../../../../domain/models/anime/anime.model.dart';
import 'character.widget.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget(this.anime, {super.key});

  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: anime.characters.length,
        itemBuilder: (context, index) =>
            CharacterWidget(anime.characters[index]),
      ),
    );
  }
}
