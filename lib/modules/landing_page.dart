import 'package:ecommerce_app/modules/main_tab.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/auth/auth_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = AuthServices.instance;

    return StreamBuilder(
        stream: auth.authStateStream(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.active) {
            if (auth.currentUser != null) {
              // auth.logout();
              return const MainTab();
            }
            return const AuthPage();
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
