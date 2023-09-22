import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import '../../../domain/models/anime.model.dart';
import 'controller/details_bloc.bloc.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView(this.anime, {super.key});
  final Anime? anime;
  @override
  Widget build(BuildContext context) {
    print('RENDERING ANIME DETAILS');
    return BlocProvider.value(
      value: di<DetailsBloc>()..add(DetailsEvent.started(anime)),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) {
              return state.when(
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loaded: () {
                  return Center(
                      child:
                          Text(context.read<DetailsBloc>().anime?.title ?? ''));
                },
              );
            },
          )),
    );
  }
}
