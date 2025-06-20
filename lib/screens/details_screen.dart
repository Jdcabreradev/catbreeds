import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/shared/header_widget.dart';
import 'package:catbreeds/widgets/cat_item_image_widget.dart';
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
          flex: 1,
          child: Hero(
            tag: 'header',
            child: HeaderWidget(headerText: 'CatBreeds'),
          ),
        ),
        Expanded(
          flex: 2,
          child: CatItemImageWidget(cat: cat, heroTag: heroTag),
        ),
        Expanded(flex: 7, child: Container()),
      ],
    );
  }
}
