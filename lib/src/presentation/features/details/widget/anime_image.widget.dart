import 'package:flutter/material.dart';

import '../../../common/widgets/network_image.widget.dart';

class AnimeImage extends StatelessWidget {
  const AnimeImage(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomNetworkImage(
        url,
        boxFit: BoxFit.fitWidth,
      ),
    );
  }
}
