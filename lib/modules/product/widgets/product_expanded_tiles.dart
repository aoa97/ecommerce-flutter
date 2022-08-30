import 'package:flutter/material.dart';

class ProductExpandedTiles extends StatelessWidget {
  const ProductExpandedTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: const [
          Divider(height: 0),
          ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: EdgeInsets.all(10),
            title: Text("Shipping Info"),
            children: [Text("This is some details ..")],
          ),
          Divider(height: 0),
          ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: EdgeInsets.all(10),
            title: Text("Support"),
            children: [Text("This is some details ..")],
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
