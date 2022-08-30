import 'package:ecommerce_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/product/widgets/add_to_cart.dart';
import 'package:ecommerce_app/modules/product/widgets/product_details.dart';
import 'package:ecommerce_app/modules/product/widgets/product_expanded_tiles.dart';
import 'package:ecommerce_app/modules/product/widgets/product_form.dart';
import 'package:ecommerce_app/widgets/ui/main_messaage.dart';
import 'package:ecommerce_app/modules/product/widgets/products_section.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selColor = product.colors[0];
    var selSize = product.sizes[0];

    _onSelAttributes(String size, String color) {
      selSize = size;
      selColor = color;
    }

    _addToCart() {
      try {
        final item = CartItem(
            productId: product.id,
            title: product.title,
            imageUrl: product.imageUrl,
            price: product.price,
            color: selColor,
            size: selSize);
        DB.instance.addToCart(item);
        MainMessage.build(context, "The product has been added to cart");
      } catch (e) {
        MainMessage.build(context, "Something went wrong");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(
            AppAssets.product_2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: size.height * .45,
            alignment: Alignment.topCenter,
          ),
          Column(
            children: [
              ProductForm(product, (size, color) => _onSelAttributes(size, color)),
              ProductDetails(product),
              const ProductExpandedTiles(),
              const ProductsSection()
            ],
          )
        ],
      )),
      bottomNavigationBar: AddToCart(_addToCart),
    );
  }
}
