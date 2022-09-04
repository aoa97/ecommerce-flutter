import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/http_overrides.dart';
import 'package:ecommerce_app/theme/palette.dart';
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
      theme: ThemeData(
          fontFamily: 'Metro',
          primarySwatch: Palette.mainSwatch,
          scaffoldBackgroundColor: Palette.scaffold,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Palette.scaffold,
            foregroundColor: Palette.black,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Palette.black,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Palette.black,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Palette.black,
            ),
            headline4: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Palette.black,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: Palette.grey,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
              color: Palette.black,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            labelStyle: const TextStyle(color: Palette.grey),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white, width: 0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white, width: 0),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white, width: 0),
            ),
          )),
    );
  }
}
