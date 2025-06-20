import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/screens/main/widgets/cat_item_header_widget.dart';
import 'package:flutter/material.dart';

class CatItemImageWidget extends StatelessWidget {
  final CatEntity cat;
  final double height;

  const CatItemImageWidget({
    super.key,
    required this.cat,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          cat.image != null
              ? CachedNetworkImage(
                  imageUrl: cat.image!.url,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.grey,
                      value: progress.progress,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/imgs/sleeping.png",
                    color: Colors.grey,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  "assets/imgs/sleeping.png",
                  fit: BoxFit.cover,
                  color: Colors.grey,
                ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black54],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          CatItemHeaderWidget(cat: cat),
        ],
      ),
    );
  }
}
