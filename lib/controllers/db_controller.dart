import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/firestore_services.dart';

// TODO: Revise
abstract class Database {
  Stream<List<Product>> productsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;

  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
        path: 'products/',
        builder: (data, documentId) => Product.fromMap(data!, documentId),
      );
}
