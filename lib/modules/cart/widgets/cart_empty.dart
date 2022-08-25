import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Cart List is Empty",
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
