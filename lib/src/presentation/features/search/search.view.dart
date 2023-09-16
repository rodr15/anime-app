import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/jikan/repository/anime.repository.jikan.impl.dart';
import '../../../domain/models/anime.model.dart';
import 'controller/search_bloc.bloc.dart';
import 'widgets/search_search_delegate.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(AnimeRepositoryJikanImpl())
        ..add(const SearchEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchSearchDelegate(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class AnimeSearchList extends StatelessWidget {
  const AnimeSearchList(this.animes, {super.key});
  final List<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animes.length,
      itemBuilder: (context, index) {
        return Text(animes[index].title);
      },
    );
  }
}
