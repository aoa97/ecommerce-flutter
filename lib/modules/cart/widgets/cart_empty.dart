import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Flexible(
        child: Center(
          child: Text(
            "Your Cart List is Empty",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    ]);
  }
}
