import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/db_services.dart';

class DB {
  DB._();
  static final instance = DB._();

  final db = DBServices.instance;
  final uid = AuthServices.instance.currentUser.uid;

  Future<void> addToCart(CartItem product) async {
    final path = 'users/$uid/cart';
    final cart = await db.getData(path);
    final existIndex = cart.indexWhere((el) =>
        el.productId == product.productId && el.color == product.color && el.size == product.size);
    if (existIndex > -1) {
      await db.updateData(
          path: '$path/${cart[existIndex].id}', data: {'qty': cart[existIndex].qty + 1});
    } else {
      await db.setData(path: path, data: product.toMap(), auto: true);
    }
  }

  Stream<List<CartItem>> getCart() {
    return db.collectionsStream(
        path: 'users/$uid/cart',
        builder: (Map<String, dynamic>? data, String documentId) {
          return CartItem.fromMap(data!, documentId);
        });
  }
}
