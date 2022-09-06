import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/widgets/layout/horizontal_product_list/h_product_skeleton.dart';
import 'package:ecommerce_app/widgets/layout/horizontal_product_list/h_product_item.dart';

class HProductList extends StatelessWidget {
  final FilterType? filter;

  const HProductList({this.filter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favIds = Provider.of<UserData>(context, listen: false).favorites;
    final size = MediaQuery.of(context).size;

    productsStream() {
      switch (filter) {
        case FilterType.sale:
          return DB.instance.getSaleProducts(favIds);
        case FilterType.recent:
          return DB.instance.getRecentProducts(favIds);
        default:
          return DB.instance.getAllProducts(favIds);
      }
    }

    return SizedBox(
      height: size.height > 700 ? 275 : size.height * .38,
      child: StreamBuilder(
          stream: productsStream(),
          builder: (_, AsyncSnapshot snap) {
            final isActive = snap.connectionState == ConnectionState.active;

            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: isActive ? snap.data.length : 5,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, index) {
                if (isActive) {
                  return HProductItem(snap.data[index]);
                }
                return const HProductSkeleton();
              },
            );
          }),
    );
  }
}
