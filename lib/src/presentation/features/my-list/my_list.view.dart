import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import '../../common/widgets/network_image.widget.dart';
import 'controller/my_list_bloc.bloc.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<MyListBloc>(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MyListBloc, MyListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (animes) => ListView.builder(
              itemCount: animes.length,
              itemBuilder: (context, index) {
                return ListTile(
                    enabled: true,
                    leading: CustomNetworkImage(animes[index].images.small!),
                    title: Text(animes[index].title),
                    subtitle: Row(
                        children: animes[index]
                            .genres
                            .map((e) => Chip(label: Text(e.name)))
                            .toList()));
              },
            ),
            error: (_) => const Center(child: Text('Error')),
          );
        },
      ),
    );
  }
}
