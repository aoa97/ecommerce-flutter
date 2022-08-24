import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const MainTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
