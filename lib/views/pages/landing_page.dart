import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:ecommerce_app/views/pages/main_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthInterface>(context, listen: false);

    return StreamBuilder(
        stream: auth.onAuthChanges(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.active) {
            final user = snap.data;
            // auth.logoutUser();
            if (user == null) {
              return ChangeNotifierProvider(
                create: (_) => AuthController(auth: auth),
                child: const AuthPage(),
              );
            }
            return const MainTab();
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
