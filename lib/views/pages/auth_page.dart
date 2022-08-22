import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/views/widgets/ui/main_button.dart';
import 'package:ecommerce_app/views/widgets/ui/social_button.dart';
import 'package:provider/provider.dart';

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
  final _emailFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  var _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _submitForm(AuthController model) async {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _usernameFocusNode.unfocus();
    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);
      try {
        await model.submit();
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
          backgroundColor: Theme.of(context).primaryColor,
        ));
      } finally {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Consumer<AuthController>(
              builder: (_, model, __) => Form(
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
                                model.authFormType == AuthFormType.login ? "Login" : "Sign Up",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty || !val.contains('@')) {
                                    return "Please enter a valid E-mail";
                                  }
                                  return null;
                                },
                                onChanged: model.updateEmail,
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    labelText: "E-mail", hintText: "Enter your e-mail"),
                              ),
                              if (model.authFormType == AuthFormType.register)
                                const SizedBox(height: 24),
                              if (model.authFormType == AuthFormType.register)
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty || val.length < 4) {
                                      return "Username must be more than 4 chars";
                                    }
                                    return null;
                                  },
                                  onChanged: model.updateUsername,
                                  controller: _usernameController,
                                  focusNode: _usernameFocusNode,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      labelText: "Username", hintText: "Enter username"),
                                ),
                              const SizedBox(height: 24),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty || val.length < 6) {
                                    return "Password must be more than 6 chars";
                                  }
                                  return null;
                                },
                                onChanged: model.updatePassword,
                                onFieldSubmitted: (_) => _submitForm(model),
                                focusNode: _passwordFocusNode,
                                controller: _passwordController,
                                obscureText: true,
                                textInputAction: TextInputAction.send,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    labelText: "Password", hintText: "Enter your password"),
                              ),
                              if (model.authFormType == AuthFormType.login)
                                Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(primary: Colors.black),
                                      child: const Text("Forgot your password?"),
                                    )),
                              SizedBox(height: model.authFormType == AuthFormType.login ? 8 : 16),
                              MainButton(
                                  loading: _loading,
                                  text:
                                      model.authFormType == AuthFormType.login ? "LOGIN" : "SIGNUP",
                                  onPressed: () => _submitForm(model)),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      _formKey.currentState!.reset();
                                      _emailController.text = '';
                                      _passwordController.text = '';
                                      _usernameController.text = '';
                                      model.toggleFormType();
                                    },
                                    style: TextButton.styleFrom(primary: Colors.black),
                                    child: Text(model.authFormType == AuthFormType.login
                                        ? "Don't have an account? Sign Up"
                                        : "Already have an account? Sign in")),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(model.authFormType == AuthFormType.login
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
                    ),
                  )),
        ),
      ),
    );
  }
}
