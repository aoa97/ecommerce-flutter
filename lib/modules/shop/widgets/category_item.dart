import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/routes.dart';
import 'package:ecommerce_app/widgets/ui/main_shadow.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, String> item;

  const CategoryItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigate() {
      Navigator.of(context).pushNamed(
        AppRoutes.categoryDetailsRoute,
        arguments: item['title'],
      );
    }

    return InkWell(
      onTap: _navigate,
      child: Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: mainShadow,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Text(
                  item['title']!,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 18),
                ),
              )),
              Expanded(
                child: Image.network(
                  item['imageUrl']!,
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }
}
