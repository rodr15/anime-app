import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/anime/models.dart';
import '../controller/search_bloc.bloc.dart';
import 'anime_search_detail.dart';

class SearchSearchDelegate extends SearchDelegate {
  SearchSearchDelegate(this.searchBloc);
  final SearchBloc searchBloc;

  Timer? _debounceTimer;

  void debouncing({required Function() fn, int waitForMs = 500}) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(Duration(milliseconds: waitForMs), fn);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) return const Text('');
    debouncing(
      fn: () => searchBloc.add(SearchEvent.search(query)),
    );
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error)),
          success: (List<Anime> animes) => _AnimeSearchList(animes),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) return const Text('');
    debouncing(
      fn: () => searchBloc.add(SearchEvent.search(query)),
    );
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (List<Anime> animes) => _AnimeSearchList(animes));
      },
    );
  }
}

class _AnimeSearchList extends StatelessWidget {
  const _AnimeSearchList(this.animes);
  final List<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: animes.length,
      itemBuilder: (context, index) {
        return AnimeSearchDetail(animes[index]);
      },
    );
  }
}
