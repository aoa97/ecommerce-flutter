import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool loading;

  const MainButton({Key? key, required this.text, required this.onPressed, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        child: loading
            ? const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white))
            : Text(text),
      ),
    );
  }
}
