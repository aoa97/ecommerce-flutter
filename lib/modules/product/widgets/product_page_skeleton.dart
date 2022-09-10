import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ProductPageSkeleton extends StatelessWidget {
  const ProductPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(),
        body: SkeletonItem(
            child: Column(children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: double.infinity,
              height: size.height * .40,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.only(top: 16, bottom: 22),
            child: SkeletonParagraph(
              style: const SkeletonParagraphStyle(
                lines: 6,
                spacing: 6,
              ),
            ),
          )
        ])));
  }
}
