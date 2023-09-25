import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/responsive.dart';
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
            child: _Content(anime: anime),
          )),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    var mobile = SingleChildScrollView(
      child: Column(
        children: [
          AnimeImage(anime.landscapeImages.large!),
          const SizedBox(height: 20),
          Padding(
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );

    final lg = Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimeImage(anime.portraitImages.large!),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 25, bottom: 10),
              child: Column(
                children: [
                  Text(
                    anime.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 50),
                  ChipsInfo(anime: anime),
                  const SizedBox(height: 50),
                  Text(
                    anime.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => context.responsive(
            mobile,
            sm: mobile,
            lg: lg,
            xl: lg,
          ),
        );
      },
    );
  }
}
