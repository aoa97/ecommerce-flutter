import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/ui/main_shadow.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final Widget child;

  const ProductCard({Key? key, required this.imageUrl, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: mainShadow),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: Row(children: [
          Image.network(
            imageUrl,
            height: size.height * .15,
            width: size.height * .15,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Expanded(
            child: Container(
              height: size.height * .15,
              padding: const EdgeInsets.all(12.0),
              child: child,
            ),
          )
        ]),
      ),
    );
  }
}
