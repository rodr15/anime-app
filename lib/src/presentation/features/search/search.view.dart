import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import 'controller/search_bloc.bloc.dart';
import 'widgets/search_search_delegate.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<SearchBloc>(),
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
