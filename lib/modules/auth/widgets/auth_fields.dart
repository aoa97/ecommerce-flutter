import 'package:ecommerce_app/utils/enums.dart';
import 'package:flutter/material.dart';

class AuthFieldsSection extends StatelessWidget {
  final AuthFormType authType;
  final Function onSubmitForm;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const AuthFieldsSection(
      {Key? key,
      required this.authType,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.nameFocusNode,
      required this.emailFocusNode,
      required this.passwordFocusNode,
      required this.onSubmitForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (authType == AuthFormType.register)
          TextFormField(
            controller: nameController,
            focusNode: nameFocusNode,
            decoration: const InputDecoration(labelText: "Name"),
            textInputAction: TextInputAction.next,
            validator: (val) {
              if (val!.isEmpty) {
                return "Please complete this field";
              } else if (val.length < 2) {
                return "Please enter a valid name";
              }
              return null;
            },
          ),
        const SizedBox(height: 8),
        TextFormField(
          controller: emailController,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(labelText: "E-mail"),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (val) {
            if (val!.isEmpty) {
              return "Please complete this field";
            } else if (!val.contains('@')) {
              return "Please enter a valid email";
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(labelText: "Password"),
          onFieldSubmitted: (_) => onSubmitForm(),
          validator: (val) {
            if (val!.isEmpty) {
              return "Please complete this field";
            } else if (val.length < 6) {
              return "Password length must be more that 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
}
