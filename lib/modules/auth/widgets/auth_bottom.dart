import 'package:ecommerce_app/utils/assets.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/widgets/ui/main_text_button.dart';
import 'package:ecommerce_app/widgets/ui/social_button.dart';
import 'package:flutter/cupertino.dart';

class AuthBottomSection extends StatelessWidget {
  final AuthFormType authType;
  final void Function() onChangeAuthType;

  const AuthBottomSection({Key? key, required this.authType, required this.onChangeAuthType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        MainTextButton(
          text: authType == AuthFormType.login
              ? "Don't have an account? Sign up"
              : "Already have an account? Login",
          onPressed: onChangeAuthType,
        ),
        const SizedBox(height: 12),
        Text(authType == AuthFormType.login
            ? 'Or login with social account'
            : 'Or sign up with social account'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(icon: AppAssets.googleIcon, onPressed: () {}),
            const SizedBox(width: 16),
            SocialButton(icon: AppAssets.facebookIcon, onPressed: () {}),
          ],
        )
      ],
    );
  }
}
