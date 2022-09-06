import 'package:flutter/material.dart';

class FilterBarItem extends StatelessWidget {
  final String? label;
  final IconData icon;

  const FilterBarItem({Key? key, this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(icon),
          if (label != null) ...[
            const SizedBox(width: 11),
            Text(
              label!,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11),
            )
          ],
        ]));
  }
}
