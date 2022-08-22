import 'package:ecommerce_app/utils/assets.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.rate,
    this.discount = 1,
  });

  // TODO: Revise
  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'],
      imageUrl: map['imageUrl'] as String,
      discount: map['discount'] as int,
      category: map['category'] as String,
      rate: map['rate'] as double,
    );
  }

  final String category;
  final int? discount;
  final String id;
  final String imageUrl;
  final double price;
  final double? rate;
  final String title;

  // TODO: Revise
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'discount': discount,
      'category': category,
      'rate': rate,
    };
  }
}

List<Product> productsList = [
  Product(
      id: '1',
      rate: 5,
      title: "Dorothy Perkins",
      category: "Evening Dress",
      imageUrl: AppAssets.product_1,
      price: 12,
      discount: 10),
  Product(
      id: '2',
      rate: 3,
      title: "Mango",
      category: "Pullover",
      imageUrl: AppAssets.product_1,
      price: 51,
      discount: 20),
  Product(
      id: '3',
      rate: 4,
      title: "Sitlly",
      category: "Sport Dress",
      imageUrl: AppAssets.product_1,
      price: 19,
      discount: 15),
  Product(
      id: '4',
      rate: 4.5,
      title: "Metropolis",
      category: "Blouse",
      imageUrl: AppAssets.product_1,
      price: 16,
      discount: 8),
  Product(
      id: '5',
      rate: 3.5,
      title: "Topshop",
      category: "Shirt",
      imageUrl: AppAssets.product_1,
      price: 20,
      discount: 13),
];
