import 'package:ecommerce_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/ui/main_shadow.dart';

class CategoryCards extends StatelessWidget {
  CategoryCards({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> list = [
    {'title': 'New', 'imageUrl': AppAssets.newCategory},
    {'title': 'Shirt', 'imageUrl': AppAssets.newShirt},
    {'title': 'T-Shirt', 'imageUrl': AppAssets.newTShirt},
    {'title': 'Pullover', 'imageUrl': AppAssets.newPullover},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map((cat) => Container(
              height: 100,
              margin: const EdgeInsets.only(bottom: 16),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: mainShadow),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Text(
                      cat['title']!,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 18),
                    ),
                  )),
                  Expanded(
                      child: Image.network(
                    cat['imageUrl']!,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                  )),
                ],
              )))
          .toList(),
    );
  }
}
