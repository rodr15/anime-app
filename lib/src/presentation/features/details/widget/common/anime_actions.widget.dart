import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/models/anime.model.dart';
import '../../controller/details_bloc.bloc.dart';
import 'animated_text_icon_button.widget.dart';

class AnimeActions extends StatelessWidget {
  const AnimeActions({super.key, required this.anime});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DetailsBloc>();
    return Row(
      children: [
        AnimatedTextIconButton(
          onPressed: () => controller.add(DetailsEvent.addAnime(anime)),
          text: 'Add to list',
          icon: Icons.add,
          selectedIcon: Icons.add_task_rounded,
          initState: controller.animeExists,
        ),
      ],
    );
  }
}
