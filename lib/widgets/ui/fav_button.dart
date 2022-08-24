import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool? isActive;

  const FavButton({Key? key, required this.onPressed, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.11,
      height: size.width * 0.11,
      child: Card(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: IconButton(
            color: isActive! ? Theme.of(context).primaryColor : Colors.grey,
            onPressed: onPressed,
            icon: Icon(
              isActive! ? Icons.favorite : Icons.favorite_border,
              size: 18,
            )),
      ),
    );
  }
}
