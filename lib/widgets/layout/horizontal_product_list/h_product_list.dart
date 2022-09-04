import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/widgets/layout/horizontal_product_list/h_product_skeleton.dart';
import 'package:ecommerce_app/widgets/layout/horizontal_product_list/h_product_item.dart';

class HProductList extends StatelessWidget {
  const HProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productsStream = DB.instance.getAllProducts;

    // TODO: Find a solution for the fixed height
    return SizedBox(
      height: size.height > 700 ? 275 : size.height * .38,
      child: StreamBuilder(
          stream: productsStream(['3WZhzcYI4sMDIoNZkTaq']),
          builder: (_, AsyncSnapshot snap) {
            final isDone = snap.connectionState == ConnectionState.active;

            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: isDone ? snap.data.length : 5,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, index) {
                if (isDone) {
                  return HProductItem(snap.data[index]);
                }
                return const HProductSkeleton();
              },
            );
          }),
    );
  }
}
