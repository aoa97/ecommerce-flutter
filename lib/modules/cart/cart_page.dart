import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_bottom_section.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_empty.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/cart/widgets/cart_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = DBServices.instance;
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: cart.ids.isEmpty
            ? const CartEmpty()
            : StreamBuilder(
                stream: db.getCartProducts(cart.items),
                builder: (_, AsyncSnapshot<List<Product>> snap) {
                  if (snap.connectionState == ConnectionState.active) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "My Bag",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        flex: 2,
                        child: CartList(snap.data!),
                      ),
                      const SizedBox(height: 25),
                      const CartBottomSection(),
                    ]);
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
      ),
    );
  }
}
