import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/jikan/repository/anime.repository.jikan.impl.dart';
import '../../../domain/usecases/anime.usecase.dart';
import 'controller/search_bloc.bloc.dart';
import 'widgets/search_search_delegate.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(AnimeUseCase(AnimeRepositoryJikanImpl()))
        ..add(const SearchEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchSearchDelegate(context.read<SearchBloc>()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
