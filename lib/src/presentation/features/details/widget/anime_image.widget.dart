import 'package:flutter/material.dart';

import '../../../common/widgets/network_image.widget.dart';

class AnimeImage extends StatelessWidget {
  const AnimeImage(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    final image = CustomNetworkImage(
      url,
      boxFit: BoxFit.fitWidth,
    );

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return SizedBox(width: double.infinity, child: image);
        }
        return SizedBox(height: double.infinity, child: image);
      },
    );
  }
}
