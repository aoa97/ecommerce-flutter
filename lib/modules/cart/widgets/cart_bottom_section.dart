import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/ui/main_button.dart';

class CartBottomSection extends StatelessWidget {
  const CartBottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
            decoration: InputDecoration(
                hintText: "Enter your promo code",
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12))),
        const SizedBox(height: 28),
        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)),
            Text("124\$", style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 28),
        // Submit Btn
        MainButton(text: "CHECK OUT", onPressed: () {}),
        const SizedBox(height: 5),
      ],
    );
  }
}
