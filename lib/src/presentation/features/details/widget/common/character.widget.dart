import 'package:flutter/material.dart';

import '../../../../../domain/models/character/character.model.dart';
import '../../../../common/widgets/network_image.widget.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget(this.character, {super.key});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Tooltip(
                message: character.name,
                child: CustomNetworkImage(
                  character.imageUrl ?? '',
                  boxFit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
