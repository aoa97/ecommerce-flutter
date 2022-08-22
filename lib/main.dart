import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/utils/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthInterface>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-commerce",
        initialRoute: AppRoutes.landingPageRoute,
        onGenerateRoute: onGenerate,
        theme: ThemeData(
            // TODO Refactor
            fontFamily: 'Metro',
            textTheme: const TextTheme(
              headline1:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 34, color: Color(0xFF222222)),
              headline2:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Color(0xFF222222)),
              headline3:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF222222)),
              headline4:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFF222222)),
              caption:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: Color(0xFF9B9B9B)),
              bodyText1: TextStyle(fontSize: 14, color: Color(0xFF222222)),
            ),
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
      ),
    );
  }
}
