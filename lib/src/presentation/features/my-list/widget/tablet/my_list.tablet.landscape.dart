import 'package:flutter/material.dart';

import '../../../../../domain/models/anime/models.dart';
import '../../../details/anime_details.view.dart';
import '../anime_list_tile.widget.dart';

class MyListTabletLandscape extends StatefulWidget {
  const MyListTabletLandscape(this.animes, {super.key});
  final List<Anime> animes;

  @override
  State<MyListTabletLandscape> createState() => _MyListTabletLandscape();
}

class _MyListTabletLandscape extends State<MyListTabletLandscape> {
  late Anime selected;
  @override
  void initState() {
    selected = widget.animes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.animes.length,
            itemBuilder: (context, index) {
              return AnimeListTile(
                widget.animes[index],
                onTap: (anime) {
                  if (selected == anime) return;
                  selected = anime!;
                  setState(() {});
                },
              );
            },
          ),
        ),
        Expanded(child: AnimeDetailsView(selected)),
      ],
    );
  }
}
