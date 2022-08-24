import 'package:ecommerce_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/modules/home/widgets/home_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final db = DBServices.instance;

    addProduct() {}

    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: addProduct, child: const Icon(Icons.add)),
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
                      style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const HomeProducts(title: "Sale", description: "Super summer sale"),
              const HomeProducts(title: "New", description: "You've never seen it before!"),
            ],
          ),
        ),
      )),
    );
  }
}
