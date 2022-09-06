import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SkeletonItem(
        child: Row(
      children: [
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            height: size.height * .15,
            width: size.height * .15,
          ),
        ),
        Expanded(
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 4,
                spacing: 6,
                lineStyle: SkeletonLineStyle(
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
        )
      ],
    ));
  }
}
