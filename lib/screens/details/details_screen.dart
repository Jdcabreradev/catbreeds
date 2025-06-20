import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/screens/details/widgets/cat_info_widget.dart';
import 'package:catbreeds/shared/cat_item_image_widget.dart';
import 'package:catbreeds/shared/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(tag: 'main-header', child: HeaderWidget()),
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                  weight: 5,
                  size: 28,
                ),
              ).fadeIn(delay: Duration(milliseconds: 500)),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Hero(
            tag: heroTag,
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 4,
              child: CatItemImageWidget(cat: cat, height: double.infinity),
            ),
          ),
        ),
        Expanded(flex: 5, child: CatInfoWidget(cat: cat)),
      ],
    );
  }
}
