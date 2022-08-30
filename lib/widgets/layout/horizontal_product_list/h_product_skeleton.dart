import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HProductSkeleton extends StatelessWidget {
  const HProductSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SkeletonItem(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonAvatar(
            style: SkeletonAvatarStyle(
          height: size.height * .25,
          width: size.width * .35,
        )),
        Expanded(
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 4,
                spacing: 6,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                  minLength: size.width / 6,
                  maxLength: size.width / 3,
                )),
          ),
        )
      ],
    ));
  }
}
