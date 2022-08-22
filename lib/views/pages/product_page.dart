import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/productOverview/products_section.dart';
import 'package:ecommerce_app/views/widgets/ui/dropdown_component.dart';
import 'package:ecommerce_app/views/widgets/ui/fav_button.dart';
import 'package:ecommerce_app/views/widgets/ui/main_button.dart';
import 'package:ecommerce_app/views/widgets/ui/rating_stars.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var _size = '';
  var _color = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
            height: size.height * .57,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropDownComponent(
                          list: const ['S', 'M', 'L'],
                          hint: "Size",
                          value: _size,
                          onChanged: (value) => setState(() => _size = value!),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                          child: DropDownComponent(
                        list: const ['Black', 'Green', 'Blue'],
                        hint: "Color",
                        value: _color,
                        onChanged: (value) => setState(() => _color = value!),
                      )),
                      const SizedBox(width: 24),
                      FavButton(
                        onPressed: () {},
                      )
                    ]),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.category,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        RatingStars(value: widget.product.rate)
                      ],
                    ),
                    Text(
                      "\$19.99",
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.all(10),
                  title: Text("Shipping Info"),
                  children: [Text("This is some details ..")],
                ),
                const Divider(height: 0),
                const ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.all(10),
                  title: Text("Support"),
                  children: [Text("This is some details ..")],
                ),
                const Divider(height: 0),
                const SizedBox(
                  height: 24,
                ),
                const ProductsSection()
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: Material(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: MainButton(
            text: "ADD TO CARD",
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
