import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  final void Function()? onPressed;

  const FavButton({Key? key, required this.onPressed}) : super(key: key);

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
            color: Colors.grey,
            onPressed: onPressed,
            icon: const Icon(
              Icons.favorite_border,
              size: 18,
            )),
      ),
    );
  }
}
