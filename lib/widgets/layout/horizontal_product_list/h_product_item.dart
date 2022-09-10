import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/theme/palette.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/widgets/ui/fav_button.dart';
import 'package:ecommerce_app/widgets/ui/item_chip.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HProductItem extends StatelessWidget {
  final Product product;

  const HProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFav = Provider.of<UserData>(context).favorites.contains(product.id);
    final size = MediaQuery.of(context).size;

    _toggleFavorite() {
      if (isFav) {
        DB.instance.removeFavorite(product.id);
      } else {
        DB.instance.addFavorite(product.id);
      }
    }

    _navigateToDetails() {
      Navigator.pushNamed(
        context,
        AppRoutes.productPageRoute,
        arguments: product.id,
      );
    }

    return InkWell(
      onTap: _navigateToDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl,
                  height: size.height * .25,
                  width: size.width * .35,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: product.isRecent!
                    ? const ItemChip(
                        title: "New",
                        color: Palette.black,
                      )
                    : ItemChip(title: '-${product.discount.toString()}%'),
              ),
              Positioned(
                bottom: -20,
                right: 0,
                child: FavButton(
                  isActive: isFav,
                  onPressed: _toggleFavorite,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          RatingStars(value: product.rate),
          const SizedBox(height: 5),
          Text(
            product.category,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 5),
          Text(
            product.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${product.price.round().toString()}\$',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
