import 'package:ecommerce_app/modules/category/widgets/filter_bar_item.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: const Color(0xFFF5F5F5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FilterBarItem(
              label: "Filters",
              icon: Icons.filter_list,
            ),
            FilterBarItem(
              label: "Price: lowest to high",
              icon: Icons.swap_vert,
            ),
            FilterBarItem(icon: Icons.view_list)
          ],
        ),
      ),
    );
  }
}
