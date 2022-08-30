import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/modules/landing_page.dart';
import 'package:ecommerce_app/modules/auth/auth_page.dart';
import 'package:ecommerce_app/modules/main_tab.dart';
import 'package:ecommerce_app/modules/product/product_page.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // Routes
    case AppRoutes.productPageRoute:
      final product = settings.arguments as Product;
      return MaterialPageRoute(builder: (_) => ProductPage(product));
    case AppRoutes.authPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    // Top-level Routes
    case AppRoutes.mainTabRoute:
      return MaterialPageRoute(builder: (_) => const MainTab());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
