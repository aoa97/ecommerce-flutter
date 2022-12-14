import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  final List<CartItem>? list;

  const CartList(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: list!.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, index) => CartListItem(list![index]),
    );
  }
}
