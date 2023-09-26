import 'package:flutter/material.dart';

import '../../../../common/widgets/network_image.widget.dart';

class AnimeImage extends StatelessWidget {
  const AnimeImage(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    final image = CustomNetworkImage(url, boxFit: BoxFit.fitWidth);

    final mobile = SizedBox(width: double.infinity, child: image);
    final tablet = SizedBox(height: double.infinity, child: image);

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return tablet;
        }
        return mobile;
      },
    );
  }
}
