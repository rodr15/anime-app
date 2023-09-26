import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/responsive.dart';
import '../../../configuration/di/dependency_injection.dart';
import '../../../domain/models/anime.model.dart';
import 'controller/details_bloc.bloc.dart';
import 'widget/mobile/anime_details.mobile.dart';
import 'widget/tablet/anime_details.tablet.dart';

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
    final mobile = AnimeDetailsMobile(anime);
    final tablet = AnimeDetailsTablet(anime);

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => context.responsive(
            mobile,
            sm: mobile,
            md: mobile,
            lg: tablet,
            xl: tablet,
          ),
        );
      },
    );
  }
}
