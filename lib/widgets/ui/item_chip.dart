import 'package:flutter/material.dart';

class ItemChip extends StatelessWidget {
  final String title;
  final Color? color;

  const ItemChip({Key? key, required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color ?? Theme.of(context).primaryColor,
      label: Text(
        title,
        style: const TextStyle(fontSize: 11, color: Colors.white),
      ),
    );
  }
}
