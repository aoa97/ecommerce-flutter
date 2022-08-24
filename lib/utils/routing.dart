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
      final productId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => ProductPage(productId));
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
