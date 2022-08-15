import 'package:ecommerce_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:ecommerce_app/views/widgets/social_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          _authType == AuthFormType.login ? "Login" : "Sign Up",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              labelText: "E-mail", hintText: "Enter your e-mail"),
                        ),
                        if (_authType == AuthFormType.register) const SizedBox(height: 24),
                        if (_authType == AuthFormType.register)
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: "Username", hintText: "Enter username"),
                          ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Password", hintText: "Enter your password"),
                        ),
                        if (_authType == AuthFormType.login)
                          Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(primary: Colors.black),
                                child: const Text("Forgot your password?"),
                              )),
                        SizedBox(height: _authType == AuthFormType.login ? 8 : 16),
                        MainButton(_authType == AuthFormType.login ? "LOGIN" : "SIGNUP", () {
                          Navigator.of(context).pushNamed(AppRoutes.landingPageRoute);
                        }),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  if (_authType == AuthFormType.login) {
                                    _authType = AuthFormType.register;
                                  } else {
                                    _authType = AuthFormType.login;
                                  }
                                });
                              },
                              style: TextButton.styleFrom(primary: Colors.black),
                              child: Text(_authType == AuthFormType.login
                                  ? "Don't have an account? Sign Up"
                                  : "Already have an account? Sign in")),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(_authType == AuthFormType.login
                                ? 'Or login with social account'
                                : 'Or sign up with social account'),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialButton(icon: AppAssets.googleIcon, onPressed: () {}),
                                SocialButton(icon: AppAssets.facebookIcon, onPressed: () {}),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
