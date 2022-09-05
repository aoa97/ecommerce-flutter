import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/http_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/theme/theme_manager.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/utils/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = PostHttpOverrides(); // Fix handshake exception
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-commerce",
      initialRoute: AppRoutes.landingPageRoute,
      onGenerateRoute: onGenerateMain,
      theme: getApplicationTheme(),
    );
  }
}
