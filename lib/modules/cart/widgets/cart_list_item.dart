import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/widgets/layout/product/product_card.dart';
import 'package:ecommerce_app/widgets/ui/qty_counter.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFav =
        Provider.of<UserData>(context).favorites.contains(item.productId);

    _navigate() {
      Navigator.of(context).pushNamed(
        AppRoutes.productPageRoute,
        arguments: item.productId,
      );
    }

    _removeFromCart() {
      DB.instance.removeCartItem(item.id!);
    }

    _toggleFavorite() {
      if (isFav) {
        DB.instance.removeFavorite(item.productId);
      } else {
        DB.instance.addFavorite(item.productId);
      }
    }

    return InkWell(
      onTap: _navigate,
      child: ProductCard(
        imageUrl: item.imageUrl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Color: ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              item.color,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 11),
                            )
                          ]),
                      const SizedBox(width: 13),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size: ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              item.size,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(fontSize: 11),
                            )
                          ]),
                    ],
                  )
                ]),
                PopupMenuButton(
                    child: Container(
                      width: 18,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.more_vert,
                      ),
                    ),
                    itemBuilder: (_) => [
                          PopupMenuItem(
                            value: 1,
                            onTap: _toggleFavorite,
                            child: Text(
                              isFav
                                  ? "Remove to favorites"
                                  : "Add to favorites",
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            onTap: _removeFromCart,
                            child: const Text("Delete from the list"),
                          ),
                        ])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Counter(id: item.id!, value: item.qty),
                Text(
                  "\$${item.price}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
