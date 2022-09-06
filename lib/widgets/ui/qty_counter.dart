import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';

Widget buildCountBtn({void Function()? onTap, IconData? icon}) {
  return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, color: Colors.grey),
        ),
      ));
}

class Counter extends StatelessWidget {
  final String id;
  final int value;

  const Counter({
    Key? key,
    required this.value,
    required this.id,
  }) : super(key: key);

  _decrement() {
    DB.instance.updateCartQty(id, value - 1);
  }

  _increment() {
    DB.instance.updateCartQty(id, value + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildCountBtn(icon: Icons.remove, onTap: _decrement),
        const SizedBox(width: 16),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14),
        ),
        const SizedBox(width: 16),
        buildCountBtn(icon: Icons.add, onTap: _increment),
      ],
    );
  }
}
