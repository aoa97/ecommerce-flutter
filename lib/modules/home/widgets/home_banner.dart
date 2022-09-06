import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/assets.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          AppAssets.homeBanner,
          width: double.infinity,
          height: size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: .3,
          child: Container(
            width: double.infinity,
            height: size.height * 0.3,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Text(
            "Street Clothes",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
