import 'package:ecommerce_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/enums.dart';
import 'package:ecommerce_app/widgets/layout/horizontal_product_list/h_product_list.dart';

class HomeProducts extends StatelessWidget {
  final String title;
  final String description;
  final FilterType? filter;

  const HomeProducts({
    Key? key,
    this.filter,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _view() {
      Navigator.of(context).pushNamed(
        AppRoutes.categoryDetailsRoute,
        arguments: title,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 34),
                  ),
                  TextButton(
                    onPressed: _view,
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 16),
          HProductList(filter: filter)
        ],
      ),
    );
  }
}
