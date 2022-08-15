import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;

  const MainButton(this.text, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Text(text),
      ),
    );
  }
}
