import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/models/product_model.dart';

class DBServices {
  DBServices._();

  static final instance = DBServices._();

  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData(
      {required String path, required Map<String, dynamic> data, bool auto = false}) async {
    if (auto) {
      final ref = _fireStore.collection(path);
      await ref.add(data);
    } else {
      final ref = _fireStore.doc(path);
      await ref.set(data);
    }
  }

  Future<void> updateData({required String path, required Map<String, dynamic> data}) async {
    final ref = _fireStore.doc(path);
    print(path);
    await ref.update(data);
  }

  Future<List<CartItem>> getData(String path) async {
    final ref = _fireStore.collection(path);
    final res = await ref.get();
    return res.docs.map((doc) => CartItem.fromMap(doc.data(), doc.id)).toList();
  }

  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _fireStore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<Product>> getProducts() {
    final ref = _fireStore.collection('products');
    final snaps = ref.snapshots();
    return snaps.map((snap) {
      return snap.docs
          .map((doc) => Product(
                id: doc.id,
                title: doc.data()['title'],
                category: doc.data()['category'],
                imageUrl: doc.data()['imageUrl'],
                price: doc.data()['rate'],
                discount: doc.data()['discount'],
                rate: doc.data()['rate'],
                isFavorite: doc.data()['isFavorite'],
                sizes: List.from(doc.data()['sizes']),
                colors: List.from(doc.data()['colors']),
              ))
          .toList();
    });
  }
}
