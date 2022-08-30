import 'package:ecommerce_app/widgets/ui/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/layout/product_card.dart';

class FavoritesListItem extends StatelessWidget {
  final Product item;

  const FavoritesListItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  _removeItem() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    Text("LIME", style: Theme.of(context).textTheme.caption),
                    InkWell(
                      onTap: _removeItem,
                      child: const Icon(Icons.close, color: Colors.grey, size: 15),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text("Shirt", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 16)),
                const SizedBox(height: 6),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("Color: ", style: Theme.of(context).textTheme.caption),
                            Text('Red',
                                style:
                                    Theme.of(context).textTheme.headline4!.copyWith(fontSize: 11))
                          ]),
                          const Text("32\$")
                        ],
                      ),
                      const SizedBox(width: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("Size: ", style: Theme.of(context).textTheme.caption),
                            Text(
                              'L',
                              style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 11),
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
                    onPressed: () {})),
          ),
        )
      ],
    );
  }
}
