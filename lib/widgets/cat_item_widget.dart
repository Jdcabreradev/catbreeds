import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/widgets/cat_item_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatItemWidget extends StatelessWidget {
  final CatEntity cat;
  final String heroTag;

  const CatItemWidget({super.key, required this.cat, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 25),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => context.push('/details', extra: [cat, heroTag]),
        child: CatItemImageWidget(cat: cat, heroTag: heroTag),
      ),
    );
  }
}
