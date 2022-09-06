import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/modules/shop/widgets/category_item.dart';

class CategoryCards extends StatelessWidget {
  CategoryCards({Key? key}) : super(key: key);

  final List<Map<String, String>> list = [
    {'title': 'New', 'imageUrl': AppAssets.newCategory},
    {'title': 'Shirt', 'imageUrl': AppAssets.newShirt},
    {'title': 'T-Shirt', 'imageUrl': AppAssets.newTShirt},
    {'title': 'Pullover', 'imageUrl': AppAssets.newPullover},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list.map((cat) => CategoryItem(cat)).toList(),
    );
  }
}
