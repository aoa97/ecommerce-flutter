import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final int qty;
  final String size;
  final String color;

  CartItem({required this.id, required this.qty, required this.color, required this.size});
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cart = {}; // {productId, qty}

  get items => {..._cart};

  get ids => {..._cart}.keys.toList();

  get totalItems {
    int total = 0;
    _cart.forEach((productId, item) => total += item.qty);
    return total;
  }

  addToCart(String productId, String color, String size) {
    final exists = _cart.containsKey(productId);
    if (exists) {
      _cart.update(productId, (currentItem) {
        return CartItem(id: currentItem.id, qty: currentItem.qty + 1, color: color, size: size);
      });
    } else {
      _cart.putIfAbsent(productId, () {
        return CartItem(id: DateTime.now().toIso8601String(), qty: 1, color: color, size: size);
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
            color: currentItem.color,
            size: currentItem.size);
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
