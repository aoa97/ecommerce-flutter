import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/product/widgets/products_section.dart';
import 'package:ecommerce_app/widgets/ui/dropdown_component.dart';
import 'package:ecommerce_app/widgets/ui/fav_button.dart';
import 'package:ecommerce_app/widgets/ui/main_button.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

// TODO: Refactor
class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage(this.productId, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final db = DBServices.instance;
  final _formKey = GlobalKey<FormState>();
  var _size = '';
  var _color = '';

  _toggleFavorite(product) {
    db.updateProduct(product.id, {'isFavorite': !product.isFavorite});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context, listen: false);

    _addToCart(id) {
      if (_formKey.currentState!.validate()) {
        cart.addToCart(id, _color, _size);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(children: [
              Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
              const SizedBox(
                width: 16,
              ),
              Text(
                "The product has been added to cart",
                style: TextStyle(color: Theme.of(context).primaryColor),
              )
            ]),
            backgroundColor: Colors.white));
      } else {
        print("error");
      }
    }

    return StreamBuilder(
      stream: db.getProductById(widget.productId),
      builder: (_, snap) {
        if (snap.connectionState == ConnectionState.active) {
          final product = snap.data as Product;

          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: size.height * .55,
                  alignment: Alignment.topCenter,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropDownComponent(
                                  list: product.sizes,
                                  hint: "Size",
                                  value: _size,
                                  onChanged: (value) => _size = value!,
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                  child: DropDownComponent(
                                list: product.colors,
                                hint: "Color",
                                value: _color,
                                onChanged: (value) => _color = value!,
                              )),
                              const SizedBox(width: 24),
                              FavButton(
                                isActive: product.isFavorite,
                                onPressed: () => _toggleFavorite(product),
                              )
                            ]),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.title,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              RatingStars(value: product.rate)
                            ],
                          ),
                          Text(
                            "\$19.99",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                      const ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        childrenPadding: EdgeInsets.all(10),
                        title: Text("Shipping Info"),
                        children: [Text("This is some details ..")],
                      ),
                      const Divider(height: 0),
                      const ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        childrenPadding: EdgeInsets.all(10),
                        title: Text("Support"),
                        children: [Text("This is some details ..")],
                      ),
                      const Divider(height: 0),
                      const SizedBox(
                        height: 24,
                      ),
                      const ProductsSection()
                    ],
                  ),
                )
              ],
            )),
            bottomNavigationBar: Material(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: MainButton(
                  text: "ADD TO CARD",
                  onPressed: () => _addToCart(product.id),
                ),
              ),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(),
            body: SkeletonItem(
                child: Column(
              children: [
                SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                  width: double.infinity,
                  height: size.height * .55,
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 6,
                        spacing: 10,
                        lineStyle: SkeletonLineStyle(
                          height: 15,
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ))
              ],
            )));
      },
    );
  }
}
