import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/product_model.dart';

class DBServices {
  DBServices._();

  static final instance = DBServices._();

  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool auto = false,
  }) async {
    if (auto) {
      final ref = _fireStore.collection(path);
      await ref.add(data);
    } else {
      final ref = _fireStore.doc(path);
      await ref.set(data);
    }
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final ref = _fireStore.doc(path);
    await ref.update(data);
  }

  Future<List> getColDocs({
    required String path,
    required Function(Map<String, dynamic> data, String id) builder,
  }) async {
    final ref = _fireStore.collection(path);
    final res = await ref.get();
    return res.docs.map((doc) => builder(doc.data(), doc.id)).toList();
  }

  Future<Map<String, dynamic>> getDocData(String path) async {
    final ref = _fireStore.doc(path);
    final res = await ref.get();
    return {'id': res.id, 'data': res.data()};
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
}
