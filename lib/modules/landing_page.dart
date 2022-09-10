import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/providers/gobal_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/utils/routing.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/modules/auth/auth_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);
    bool loggedIn = user != null;

    if (loggedIn) {
      return MultiProvider(
        providers: [
          StreamProvider<UserData>.value(
            value: DB.instance.getUserData(),
            initialData: UserData.initial(),
          ),
          StreamProvider<List<CartItem>>.value(
            value: DB.instance.getUserCart(),
            initialData: const [],
          ),
          ChangeNotifierProvider<GlobalSettings>.value(value: GlobalSettings())
        ],
        child: const Navigator(onGenerateRoute: onGenerateAuthenticated),
      );
    } else if (!loggedIn) {
      return const AuthPage();
    }

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
