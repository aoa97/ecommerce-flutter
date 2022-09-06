import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/widgets/layout/product/product_skeleton.dart';
import 'package:ecommerce_app/modules/category/widgets/category_list_item.dart';
import 'package:ecommerce_app/modules/category/widgets/filter_bar.dart';
import 'package:provider/provider.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String title;

  const CategoryDetailsPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final favIds = Provider.of<UserData>(context, listen: false).favorites;

    productsStream() {
      switch (title) {
        case 'Sale':
          return DB.instance.getSaleProducts(favIds);
        case 'New':
          return DB.instance.getRecentProducts(favIds);
        default:
          return DB.instance.getCategoryProducts(title);
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: size.height * .15,
        title: Text(title),
        bottom: const PreferredSize(
          preferredSize: Size.zero,
          child: FilterBar(),
        ),
      ),
      body: StreamBuilder<Object>(
          stream: productsStream(),
          builder: (_, AsyncSnapshot snap) {
            var isActive = snap.connectionState == ConnectionState.active;
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: isActive ? snap.data.length : 5,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (_, index) => isActive
                  ? CategoryListItem(snap.data[index])
                  : const ProductSkeleton(),
            );
          }),
    );
  }
}
