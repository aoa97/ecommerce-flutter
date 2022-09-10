import 'package:ecommerce_app/providers/gobal_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/ui/main_messaage.dart';
import 'package:ecommerce_app/modules/product/widgets/add_to_cart.dart';
import 'package:ecommerce_app/modules/product/widgets/product_details.dart';
import 'package:ecommerce_app/modules/product/widgets/product_expanded_tiles.dart';
import 'package:ecommerce_app/modules/product/widgets/product_form.dart';
import 'package:ecommerce_app/modules/product/widgets/products_section.dart';
import 'package:ecommerce_app/modules/product/widgets/product_page_skeleton.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage(this.id, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Provider.of<GlobalSettings>(context, listen: false).hideBottomTab();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selColor = '';
    var selSize = '';

    // CB to get attributes from form widget
    _onSelAttributes(String size, String color) {
      selSize = size;
      selColor = color;
    }

    _addToCart(Product product) {
      try {
        final item = CartItem(
          productId: product.id,
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          color: selColor,
          size: selSize,
        );
        DB.instance.addToCart(item);
        MainMessage.build(context, "The product has been added to cart");
      } catch (e) {
        MainMessage.build(context, "Something went wrong");
      }
    }

    return StreamBuilder<Product>(
        stream: DB.instance.getProductById(widget.id),
        builder: (context, snap) {
          final product = snap.data;

          if (snap.connectionState == ConnectionState.active) {
            return Scaffold(
              appBar: AppBar(
                title: Text(product!.title),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share))
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * .45,
                      alignment: Alignment.topCenter,
                    ),
                    Column(
                      children: [
                        ProductForm(
                          product,
                          (size, color) => _onSelAttributes(size, color),
                        ),
                        ProductDetails(product),
                        const ProductExpandedTiles(),
                        const ProductsSection()
                      ],
                    )
                  ],
                ),
              ),
              bottomNavigationBar: AddToCart(() => _addToCart(product)),
            );
          }
          return const ProductPageSkeleton();
        });
  }
}
