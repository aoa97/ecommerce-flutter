import 'package:flutter/foundation.dart';
import 'package:ecommerce_app/models/cart_Item_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cart = {}; // {productId, CartItem}

  get items => {..._cart};

  get ids => {..._cart}.keys.toList();

  get totalItems {
    int total = 0;
    _cart.forEach((productId, item) => total += item.qty);
    return total;
  }

  get totalAmount {
    double total = 0;
    _cart.forEach((productId, item) => total += item.qty * item.price);
    return total;
  }

  addToCart(String productId, String title, double price, String color, String size) {
    final exists = _cart.containsKey(productId);
    if (exists) {
      _cart.update(productId, (currentItem) {
        return CartItem(
          id: currentItem.id,
          title: currentItem.title,
          price: currentItem.price,
          qty: currentItem.qty + 1,
          color: color,
          size: size,
        );
      });
    } else {
      _cart.putIfAbsent(productId, () {
        return CartItem(
          id: DateTime.now().toIso8601String(),
          qty: 1,
          title: title,
          price: price,
          color: color,
          size: size,
        );
      });
    }
    notifyListeners();
  }

  removeFromCart(String productId) {
    if (!_cart.containsKey(productId)) {
      return;
    }

    if (_cart[productId]!.qty > 1) {
      _cart.update(productId, (currentItem) {
        return CartItem(
          id: currentItem.id,
          qty: currentItem.qty - 1,
          title: currentItem.title,
          price: currentItem.price,
          color: currentItem.color,
          size: currentItem.size,
        );
      });
    } else {
      _cart.remove(productId);
    }

    notifyListeners();
  }

  clearCart() {
    _cart.clear();
  }
}
