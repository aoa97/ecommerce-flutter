import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/favorites/widgets/favorites_list_item.dart';
import 'package:ecommerce_app/models/product_model.dart';

class FavoritesList extends StatelessWidget {
  final List<Product>? list;

  const FavoritesList(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: list!.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, index) => FavoritesListItem(list![index]),
    );
  }
}
