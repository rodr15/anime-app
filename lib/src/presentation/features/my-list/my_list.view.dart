import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configuration/di/dependency_injection.dart';
import 'controller/my_list_bloc.bloc.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<MyListBloc>(),
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return const ListTile();
          },
        ),
      ),
    );
  }
}
