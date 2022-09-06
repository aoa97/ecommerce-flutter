import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/ui/rating_stars.dart';
import 'package:ecommerce_app/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.category,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  RatingStars(value: product.rate)
                ],
              ),
              Text(
                '\$${product.price}',
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
        ],
      ),
    );
  }
}
