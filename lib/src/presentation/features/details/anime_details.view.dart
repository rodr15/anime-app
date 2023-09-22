import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import '../../../domain/models/anime.model.dart';
import 'controller/details_bloc.bloc.dart';
import 'widget/anime_actions.widget.dart';
import 'widget/anime_chips_info.widget.dart';
import 'widget/anime_image.widget.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView(this.anime, {super.key});
  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<DetailsBloc>()..add(DetailsEvent.load(anime)),
      child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimeImage(anime.images.large!),
                  const SizedBox(height: 20),
                  _Content(anime: anime),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  anime.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                ChipsInfo(anime: anime),
                AnimeActions(anime: anime),
                const SizedBox(height: 20),
                Text(
                  anime.description,
                  style: Theme.of(context).textTheme.labelLarge,
                  // maxLines: 4,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
