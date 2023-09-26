import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/responsive.dart';
import '../../../configuration/di/dependency_injection.dart';
import 'controller/my_list_bloc.bloc.dart';
import 'widget/mobile/my_list.mobile.widget.dart';
import 'widget/tablet/my_list.tablet.widget.dart';

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
            success: (animes) {
              return context.responsive(
                MyListMobile(animes),
                sm: MyListMobile(animes),
                md: MyListMobile(animes),
                lg: MyListTablet(animes),
                xl: MyListTablet(animes),
              );
            },
            error: (_) => const Center(child: Text('Error')),
          );
        },
      ),
    );
  }
}
