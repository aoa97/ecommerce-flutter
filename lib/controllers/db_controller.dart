import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/db_services.dart';

class DB {
  DB._();
  static final instance = DB._();

  final db = DBServices.instance;
  final uid = AuthServices.instance.currentUser.uid;

  Future<void> addToCart(CartItem product) async {
    final path = 'users/$uid/cart';
    final cart = await db.getColDocs(
        path: path,
        builder: (Map<String, dynamic> data, String id) =>
            CartItem.fromMap(data, id));
    final existIndex = cart.indexWhere((el) =>
        el.productId == product.productId &&
        el.color == product.color &&
        el.size == product.size);
    if (existIndex > -1) {
      await db.updateData(
          path: '$path/${cart[existIndex].id}',
          data: {'qty': cart[existIndex].qty + 1});
    } else {
      await db.setData(path: path, data: product.toMap(), auto: true);
    }
  }

  Stream<List<Product>> getFavoriteProducts(List<String> favIds) {
    return db.collectionsStream(
        path: 'products',
        queryBuilder: (query) => query.where(
              FieldPath.documentId,
              whereIn: List.from(favIds),
            ),
        builder: (Map<String, dynamic>? data, String documentId) {
          return Product.fromMap(data!, documentId);
        });
  }

  Stream<List<Product>> getCategoryProducts(String category) {
    return db.collectionsStream(
        path: 'products',
        queryBuilder: (query) => query.where(
              'category',
              isEqualTo: category,
            ),
        builder: (Map<String, dynamic>? data, String documentId) {
          return Product.fromMap(data!, documentId);
        });
  }

  Stream<List<Product>> getSaleProducts(List<String> favIds) {
    return db.collectionsStream(
        path: 'products',
        queryBuilder: (query) => query.where(
              'discount',
              isGreaterThan: 0,
            ),
        builder: (Map<String, dynamic>? data, String documentId) {
          final isFavorite = favIds.contains(documentId);
          return Product.fromMap(data!, documentId, isFavorite: isFavorite);
        });
  }

  Stream<List<Product>> getRecentProducts(List<String> favIds) {
    return db.collectionsStream(
        path: 'products',
        queryBuilder: (query) =>
            query.orderBy('createdAt', descending: true).limit(2),
        builder: (Map<String, dynamic>? data, String documentId) {
          final isFavorite = favIds.contains(documentId);
          return Product.fromMap(
            data!,
            documentId,
            isFavorite: isFavorite,
            isRecent: true,
          );
        });
  }

  Stream<List<Product>> getAllProducts(List<String> favIds) {
    return db.collectionsStream(
        path: 'products',
        builder: (Map<String, dynamic>? data, String documentId) {
          final isFavorite = favIds.contains(documentId);
          return Product.fromMap(data!, documentId, isFavorite: isFavorite);
        });
  }

  Future<void> addFavorite(String productId) async {
    await db.updateData(path: '/users/$uid', data: {
      'favorites': FieldValue.arrayUnion([productId])
    });
  }

  Future<void> removeFavorite(String productId) async {
    await db.updateData(path: '/users/$uid', data: {
      'favorites': FieldValue.arrayRemove([productId])
    });
  }

  Stream<UserData> getUserData() {
    return db.documentsStream(
        path: 'users/$uid',
        builder: (Map<String, dynamic>? data, String documentId) {
          return UserData.fromMap(data!, documentId);
        });
  }

  Stream<List<CartItem>> getUserCart() {
    return db.collectionsStream(
        path: 'users/$uid/cart',
        builder: (Map<String, dynamic>? data, String documentId) {
          return CartItem.fromMap(data!, documentId);
        });
  }
}
