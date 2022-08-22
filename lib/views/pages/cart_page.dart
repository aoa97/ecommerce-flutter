import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/cart/cart_item.dart';
import 'package:ecommerce_app/views/widgets/ui/main_button.dart';
import 'package:flutter/material.dart';

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "My Bag",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 24),
          Expanded(
            flex: 2,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: productsList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (_, index) => CartItem(productsList[index]),
            ),
          ),
          const SizedBox(height: 25),
          DecoratedBox(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(offset: Offset(0, 1), blurRadius: 8, color: Color.fromRGBO(0, 0, 0, 0.05))
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your promo code",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12))),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)),
              Text("124\$", style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 28),
          MainButton(text: "CHECK OUT", onPressed: () {}),
          const SizedBox(height: 5),
        ]),
      ),
    );
  }
}
