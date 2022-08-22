import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/views/widgets/ui/fav_button.dart';
import 'package:ecommerce_app/views/widgets/ui/rating_stars.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.productPageRoute, arguments: product),
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
                  child: Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '-${product.discount.toString()}%',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 0,
                  child: FavButton(
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            RatingStars(
              value: product.rate,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Dorothy Perkins",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Evening Dress",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "19\$",
              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
