import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/widgets/cat_item_header_widget.dart';
import 'package:flutter/material.dart';

class CatItemImageWidget extends StatelessWidget {
  const CatItemImageWidget({
    super.key,
    required this.cat,
    required this.heroTag,
  });

  final CatEntity cat;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: SizedBox(
        height: 300,
        child: Stack(
          fit: StackFit.expand,
          children: [
            cat.image != null
                ? CachedNetworkImage(
                    imageUrl: cat.image!.url,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.black,
                            value: progress.progress,
                          ),
                        ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/imgs/sleeping.png",
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset("assets/imgs/sleeping.png", fit: BoxFit.cover),
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
      ),
    );
  }
}
