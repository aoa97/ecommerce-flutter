import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/utils/routing.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-commerce",
      initialRoute: AppRoutes.authPageRoute, // temp
      onGenerateRoute: onGenerate,
      theme: ThemeData(
          primaryColor: const Color(0xFFDB3022),
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFF222222),
          ),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)))),
    );
  }
}
