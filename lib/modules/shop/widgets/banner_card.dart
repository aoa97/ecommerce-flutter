import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/widgets/ui/main_shadow.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigate() {
      Navigator.of(context).pushNamed(
        AppRoutes.categoryDetailsRoute,
        arguments: 'Sale',
      );
    }

    return InkWell(
      onTap: _navigate,
      child: Container(
        padding: const EdgeInsets.all(28),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: mainShadow,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "SUMMER SALES",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Up to 50% off",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
