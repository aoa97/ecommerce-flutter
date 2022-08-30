import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_bottom_section.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_empty.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: StreamBuilder(
              stream: DB.instance.getCart(),
              builder: (_, AsyncSnapshot<List<CartItem>> snap) {
                if (snap.connectionState == ConnectionState.active) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      "My Bag",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      flex: 2,
                      child: snap.data!.isNotEmpty ? CartList(snap.data) : const CartEmpty(),
                    ),
                    if (snap.data!.isNotEmpty) const SizedBox(height: 25),
                    if (snap.data!.isNotEmpty) const CartBottomSection(),
                  ]);
                }
                return const Center(child: CircularProgressIndicator());
                // TODO: Create skeleton
              })),
    );
  }
}
