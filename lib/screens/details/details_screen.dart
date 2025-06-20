import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/shared/cat_item_image_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CatEntity cat;
  final String heroTag;

  const DetailsScreen({super.key, required this.cat, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CatItemImageWidget(cat: cat, heroTag: heroTag,height: double.infinity),
        ),
        Expanded(flex: 5, child: Container()),
      ],
    );
  }
}
