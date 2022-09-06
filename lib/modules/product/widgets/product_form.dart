import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/widgets/ui/fav_button.dart';
import 'package:ecommerce_app/widgets/ui/dropdown_component.dart';

enum Attribute { size, color }

class ProductForm extends StatefulWidget {
  final Product product;
  final Function onSelAttributes;

  const ProductForm(this.product, this.onSelAttributes, {super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late var _size = '';
  late var _color = '';

  @override
  void initState() {
    _size = widget.product.sizes[0];
    _color = widget.product.colors[0];
    widget.onSelAttributes(_size, _color);
    super.initState();
  }

  _selAttributes(Attribute att, String? value) {
    if (att == Attribute.color) {
      _color = value!;
    } else {
      _size = value!;
    }
    widget.onSelAttributes(_size, _color);
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserData>(context);
    final isFav = userState.favorites.contains(widget.product.id);

    _toggleFavorite() {
      if (isFav) {
        DB.instance.removeFavorite(widget.product.id);
      } else {
        DB.instance.addFavorite(widget.product.id);
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(top: 16, bottom: 22),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropDownComponent(
                list: widget.product.sizes,
                value: _size,
                onChanged: (value) => _selAttributes(Attribute.size, value),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: DropDownComponent(
                list: widget.product.colors,
                value: _color,
                onChanged: (value) => _selAttributes(Attribute.color, value),
              ),
            ),
            const SizedBox(width: 24),
            FavButton(isActive: isFav, onPressed: _toggleFavorite)
          ]),
    );
  }
}
