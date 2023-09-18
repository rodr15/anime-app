import 'package:flutter/material.dart';

import '../search/search.app_bar.widget.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(),
    );
  }
}
