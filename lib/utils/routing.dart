import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:ecommerce_app/views/pages/landing_page.dart';
import 'package:ecommerce_app/views/pages/main_tab.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/routes.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPageRoute:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.mainTabRoute:
      return MaterialPageRoute(builder: (_) => const MainTab());
    case AppRoutes.landingPageRoute:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage());
  }
}
