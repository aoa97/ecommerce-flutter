import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: productsList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, index) => CartListItem(productsList[index]),
    );
  }
}
