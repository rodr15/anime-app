import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import '../search/search.app_bar.widget.dart';
import 'controller/popular_anime_bloc.bloc.dart';
import 'widgets/popular_anime_list.widget.dart';

class PopularAnimeView extends StatelessWidget {
  const PopularAnimeView({super.key});

  static const String routeName = '/popular-anime';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<PopularAnimeBloc>(),
      child: Scaffold(
          appBar: const SearchAppBar(),
          body: BlocConsumer<PopularAnimeBloc, PopularAnimeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (animes) => PopularAnimeList(animes),
                error: (_) => const Center(child: Text('Error')),
              );
            },
          )),
    );
  }
}
