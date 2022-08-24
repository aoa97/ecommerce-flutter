import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product_model.dart';

class DBServices {
  DBServices._();

  static final instance = DBServices._();

  final _db = FirebaseFirestore.instance;

  Future<void> setData(String path, Map<String, dynamic> data, {bool auto = false}) async {
    if (auto) {
      final ref = _db.collection(path);
      await ref.add(data);
    } else {
      final ref = _db.doc(path);
      await ref.set(data);
    }
  }

  Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    final ref = _db.doc('products/$id');
    await ref.update(data);
  }

  Stream getProducts() {
    final ref = _db.collection('products');
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

  Stream getProductById(String id) {
    final ref = _db.doc('products/$id');
    final snap = ref.snapshots();
    return snap.map((doc) => Product(
          id: doc.id,
          title: doc.data()!['title'],
          category: doc.data()!['category'],
          imageUrl: doc.data()!['imageUrl'],
          price: doc.data()!['rate'],
          discount: doc.data()!['discount'],
          rate: doc.data()!['rate'],
          isFavorite: doc.data()!['isFavorite'],
          sizes: List.from(doc.data()!['sizes']),
          colors: List.from(doc.data()!['colors']),
        ));
  }
}
