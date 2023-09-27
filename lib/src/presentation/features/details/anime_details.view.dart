import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/responsive.dart';
import '../../../configuration/di/dependency_injection.dart';
import 'controller/details_bloc.bloc.dart';
import 'widget/mobile/anime_details.mobile.dart';
import 'widget/tablet/anime_details.tablet.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView(this.animeId, {super.key});
  final int animeId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<DetailsBloc>()..add(DetailsEvent.load(animeId)),
      child: Scaffold(
          appBar: AppBar(),
          body: const SafeArea(
            child: _Content(),
          )),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    const mobile = AnimeDetailsMobile();
    const tablet = AnimeDetailsTablet();

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () {
            return context.responsive(
              mobile,
              sm: mobile,
              md: mobile,
              lg: tablet,
              xl: tablet,
            );
          },
        );
      },
    );
  }
}
