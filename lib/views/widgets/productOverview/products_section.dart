import 'package:ecommerce_app/views/widgets/layout/horizontal_products.dart';
import 'package:flutter/material.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "You can also like this",
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            "12 items",
            style: Theme.of(context).textTheme.caption,
          ),
        ]),
        const SizedBox(
          height: 12,
        ),
        const HorizontalProducts()
      ],
    );
  }
}
