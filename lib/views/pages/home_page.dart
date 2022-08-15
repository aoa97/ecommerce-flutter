import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/views/widgets/home/product_list.dart';

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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    AppAssets.homeBanner,
                    width: double.infinity,
                    height: size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Opacity(
                    opacity: .3,
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.3,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Text(
                      "Street Clothes",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const ProductList(title: "Sale", description: "Super summer sale"),
              const ProductList(title: "New", description: "You’ve never seen it before!"),
            ],
          ),
        ),
      )),
    );
  }
}
