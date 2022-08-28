import 'package:ecommerce_app/services/db_services.dart';
import 'package:ecommerce_app/widgets/layout/product_list_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/layout/product_list_item.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productsStream = DBServices.instance.getProducts;

    return SizedBox(
      height: size.height > 700 ? 275 : 230,
      child: StreamBuilder(
          stream: productsStream(),
          builder: (_, AsyncSnapshot snap) {
            final isDone = snap.connectionState == ConnectionState.active;

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: isDone ? snap.data.length : 5,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, index) {
                if (isDone) {
                  return ProductListItem(snap.data[index]);
                }
                return const ProductListSkeleton();
              },
            );
          }),
    );
  }
}
