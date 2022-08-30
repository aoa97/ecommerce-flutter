import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/modules/auth/widgets/auth_bottom.dart';
import 'package:ecommerce_app/modules/auth/widgets/auth_fields.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/widgets/ui/main_button.dart';
import 'package:ecommerce_app/widgets/ui/main_text_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameFoucsNode = FocusNode();
  final _emailFoucsNode = FocusNode();
  final _passwordFoucsNode = FocusNode();
  var _authType = AuthFormType.login;
  var _loading = false;
  final req = AuthServices.instance;

  _submitForm() async {
    _nameFoucsNode.unfocus();
    _emailFoucsNode.unfocus();
    _passwordFoucsNode.unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() => _loading = true);
      try {
        if (_authType == AuthFormType.register) {
          await req.register(_emailController.text.trim(), _passwordController.text.trim(),
              _nameController.text.trim());
        } else {
          await req.login(_emailController.text.trim(), _passwordController.text.trim());
        }
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Theme.of(context).primaryColor, content: Text(e.message!)));
      } finally {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 74, bottom: 43, left: 16, right: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    _authType == AuthFormType.login ? "Login" : "Sign up",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 73),
                  AuthFieldsSection(
                    authType: _authType,
                    onSubmitForm: _submitForm,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    nameFocusNode: _nameFoucsNode,
                    emailFocusNode: _emailFoucsNode,
                    passwordFocusNode: _passwordFoucsNode,
                  ),
                  if (_authType == AuthFormType.login)
                    Align(
                      alignment: Alignment.centerRight,
                      child: MainTextButton(
                        text: "Forgot your password?",
                        onPressed: () {},
                      ),
                    ),
                  const SizedBox(height: 14),
                  MainButton(
                    text: _authType == AuthFormType.login ? "LOGIN" : "SIGN UP",
                    onPressed: _submitForm,
                    loading: _loading,
                  ),
                  const Spacer(),
                  // Bottom Section
                  AuthBottomSection(
                      authType: _authType,
                      onChangeAuthType: () {
                        setState(() {
                          if (_authType == AuthFormType.login) {
                            _authType = AuthFormType.register;
                          } else {
                            _authType = AuthFormType.login;
                          }
                          _nameController.text = '';
                          _emailController.text = '';
                          _passwordController.text = '';
                        });
                      })
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
