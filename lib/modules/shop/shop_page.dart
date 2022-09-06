import 'package:ecommerce_app/modules/shop/widgets/banner_card.dart';
import 'package:ecommerce_app/modules/shop/widgets/category_cards.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Categories"),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(children: [
            const BannerCard(),
            CategoryCards(),
          ]),
        ),
      ),
    );
  }
}
