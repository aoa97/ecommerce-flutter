import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/modules/home/widgets/home_banner.dart';
import 'package:ecommerce_app/modules/home/widgets/home_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                const HomeBanner(),
                SizedBox(height: size.height * .05),
                const HomeProducts(
                  title: "Sale",
                  description: "Super summer sale",
                  filter: FilterType.sale,
                ),
                SizedBox(height: size.height * .05),
                const HomeProducts(
                  title: "New",
                  description: "You've never seen it before!",
                  filter: FilterType.recent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
