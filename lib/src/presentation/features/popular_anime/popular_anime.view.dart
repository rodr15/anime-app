import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import 'controller/popular_anime_bloc.bloc.dart';

class PopularAnimeView extends StatelessWidget {
  const PopularAnimeView({super.key});

  static const String routeName = '/popular-anime';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<PopularAnimeBloc>(),
      child: Scaffold(
          body: BlocConsumer<PopularAnimeBloc, PopularAnimeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (animes) => ListView.builder(
              itemCount: animes.length,
              itemBuilder: (context, index) {
                return Text(animes[index].title);
              },
            ),
            error: (_) => const Center(child: Text('Error')),
          );
        },
      )),
    );
  }
}
