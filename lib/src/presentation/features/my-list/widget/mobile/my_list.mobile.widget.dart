import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import 'my_list.mobile.landscape.dart';
import 'my_list.mobile.portrait.dart';

class MyListMobile extends StatelessWidget {
  const MyListMobile(this.animes, {super.key});
  final List<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.landscape
            ? MyListMobileLandscape(animes)
            : MyListMobilePortrait(animes);
      },
    );
  }
}
