import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/layout/product/product_card.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';

class CategoryListItem extends StatelessWidget {
  final Product item;

  const CategoryListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
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
                const RatingStars(),
                Text(
                  "\$${item.price}",
                  style: Theme.of(context).textTheme.bodyText1,
                )
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
                color: Colors.white,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 19,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                )),
          ),
        )
      ],
    );
  }
}
