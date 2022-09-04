import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/main_tab.dart';
import 'package:ecommerce_app/modules/product/product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/modules/landing_page.dart';
import 'package:ecommerce_app/modules/auth/auth_page.dart';

// App level routes. Either auth(no user) or landing(user)
Route<dynamic>? onGenerateMain(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => StreamProvider<User?>.value(
          value: AuthServices.instance.authStateStream(),
          initialData: null,
          child: const LandingPage(),
        ),
      );
  }
}

// Authenticated routes
Route<dynamic>? onGenerateAuthenticated(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.productPageRoute:
      final product = settings.arguments as Product;
      return MaterialPageRoute(builder: (_) => ProductPage(product));
    default:
      return MaterialPageRoute(builder: (_) => const MainTab());
  }
}
