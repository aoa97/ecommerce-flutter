import 'package:flutter/material.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Text(
          "Your Favorites List is Empty",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
