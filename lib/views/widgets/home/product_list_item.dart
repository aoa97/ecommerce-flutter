import 'package:ecommerce_app/models/product.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
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
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              SizedBox(
                width: 2.5,
              ),
              Text(
                "(10)",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
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
    );
  }
}
