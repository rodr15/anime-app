import 'package:flutter/material.dart';

import '../../../../../domain/models/anime.model.dart';
import 'my_list.tablet.landscape.dart';
import 'my_list.tablet.portrait.dart';

class MyListTablet extends StatelessWidget {
  const MyListTablet(this.animes, {super.key});
  final List<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.landscape
            ? MyListTabletLandscape(animes)
            : MyListTabletPortrait(animes);
      },
    );
  }
}
