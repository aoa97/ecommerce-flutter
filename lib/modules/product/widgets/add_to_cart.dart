import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/ui/main_button.dart';

class AddToCart extends StatelessWidget {
  final void Function()? onPressed;

  const AddToCart(
    this.onPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: MainButton(
          text: "ADD TO CART",
          onPressed: onPressed,
        ),
      ),
    );
  }
}
