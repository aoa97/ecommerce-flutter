import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/widgets/ui/main_messaage.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/layout/product_card.dart';

class FavoritesListItem extends StatelessWidget {
  final Product item;

  const FavoritesListItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    _addToCart() {
      try {
        final product = CartItem(
          productId: item.id,
          title: item.title,
          imageUrl: item.imageUrl,
          price: item.price,
          color: item.colors[0],
          size: item.colors[0],
        );
        DB.instance.addToCart(product);
        MainMessage.build(context, "The product has been added to cart");
      } catch (e) {
        MainMessage.build(context, "Something went wrong");
      }
    }

    _removeFromFavorites() {}

    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        ProductCard(
            imageUrl: item.imageUrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.category,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    InkWell(
                      onTap: _removeFromFavorites,
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 16)),
                const SizedBox(height: 6),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("Color: ",
                                style: Theme.of(context).textTheme.caption),
                            Text(item.colors[0],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontSize: 11))
                          ]),
                          Text("\$${item.price}")
                        ],
                      ),
                      const SizedBox(width: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("Size: ",
                                style: Theme.of(context).textTheme.caption),
                            Text(
                              item.sizes[0],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 11),
                            )
                          ]),
                          const RatingStars(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: -15,
          right: 5,
          child: SizedBox(
            width: size.width * 0.12,
            height: size.width * 0.12,
            child: Card(
                elevation: 5,
                color: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 19,
                    color: Colors.white,
                  ),
                  onPressed: _addToCart,
                )),
          ),
        )
      ],
    );
  }
}
