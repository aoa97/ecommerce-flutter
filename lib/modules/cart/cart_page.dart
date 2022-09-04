import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_bottom_section.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_empty.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cart = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
          padding: const EdgeInsets.all(14.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "My Bag",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 2,
              child: cart.isNotEmpty ? CartList(cart) : const CartEmpty(),
            ),
            if (cart.isNotEmpty) ...[
              const SizedBox(height: 25),
              const CartBottomSection()
            ]
          ])),
    );
  }
}
