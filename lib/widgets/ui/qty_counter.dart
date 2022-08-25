import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int value;

  const Counter(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
            color: Colors.white,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.remove, color: Colors.grey),
              ),
            )),
        const SizedBox(width: 16),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14),
        ),
        const SizedBox(width: 16),
        Material(
            color: Colors.white,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.add, color: Colors.grey),
              ),
            )),
      ],
    );
  }
}
