import 'package:ecommerce_app/widgets/ui/fav_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/layout/product/product_card.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';

class CategoryListItem extends StatelessWidget {
  final Product item;

  const CategoryListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userState = Provider.of<UserData>(context);
    final isFav = userState.favorites.contains(item.id);

    _toggleFavorite() {
      if (isFav) {
        DB.instance.removeFavorite(item.id);
      } else {
        DB.instance.addFavorite(item.id);
      }
    }

    _navigate() {
      Navigator.of(context).pushNamed(
        AppRoutes.productPageRoute,
        arguments: item,
      );
    }

    return InkWell(
      onTap: _navigate,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ProductCard(
              imageUrl: item.imageUrl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 16),
                  ),
                  RatingStars(value: item.rate),
                  Text(
                    "\$${item.price}",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              )),
          Positioned(
            bottom: -15,
            right: 5,
            child: FavButton(
              onPressed: _toggleFavorite,
              isActive: isFav,
            ),
          )
        ],
      ),
    );
  }
}
