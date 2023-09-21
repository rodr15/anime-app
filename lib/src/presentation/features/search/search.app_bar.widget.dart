import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/search_bloc.bloc.dart';
import 'widgets/search_search_delegate.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
