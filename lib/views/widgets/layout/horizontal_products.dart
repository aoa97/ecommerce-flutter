import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/layout/product_item.dart';

class HorizontalProducts extends StatelessWidget {
  const HorizontalProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: productsList.map((product) => ProductListItem(product)).toList(),
      ),
    );
  }
}
