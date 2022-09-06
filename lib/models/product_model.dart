import 'package:ecommerce_app/utils/assets.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final double price;
  final int? discount;
  final double? rate;
  final List<String> sizes;
  final List<String> colors;
  final bool? isFavorite;
  final bool? isRecent;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.colors,
    this.rate,
    this.discount = 1,
    this.isFavorite,
    this.isRecent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'discount': discount,
      'rate': rate,
      'sizes': sizes,
      'colors': colors,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromMap(
    Map<String, dynamic> map,
    String documentId, {
    bool? isFavorite,
    bool? isRecent,
  }) {
    return Product(
      id: documentId,
      title: map['title'] ?? '',
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'].toDouble() ?? 0, // Explicitly casting
      discount: map['discount'] ?? 0,
      rate: map['rate'].toDouble() ?? 0,
      colors: List.from(map['colors']),
      sizes: List.from(map['sizes']),
      isFavorite: isFavorite ?? false,
      isRecent: isRecent ?? false,
    );
  }
}

// TODO: TEMP DUMMY DATA
List<Product> productsList = [
  Product(
      id: '1',
      rate: 5,
      title: "Dorothy Perkins",
      category: "Evening Dress",
      imageUrl: AppAssets.product_1,
      price: 12,
      discount: 10,
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Purple', 'Black', 'Blue']),
  Product(
    id: '2',
    rate: 3,
    title: "Mango",
    category: "Summer Shirt",
    imageUrl: AppAssets.product_2,
    price: 51,
    discount: 20,
    sizes: ['S', 'M'],
    colors: ['Green', 'White'],
  ),
  Product(
    id: '3',
    rate: 4,
    title: "Sitlly",
    category: "T-Shirt",
    imageUrl: AppAssets.product_3,
    price: 19,
    discount: 15,
    sizes: ['S', 'M', 'L'],
    colors: ['Blue', 'White'],
  ),
  Product(
    id: '4',
    rate: 4.5,
    title: "Metropolis",
    category: "Bullover",
    imageUrl: AppAssets.product_4,
    price: 16,
    discount: 8,
    sizes: ['S', 'M'],
    colors: ['Teal', 'Red'],
  ),
  Product(
    id: '5',
    rate: 3.5,
    title: "Topshop",
    category: "Winter Shirt",
    imageUrl: AppAssets.product_5,
    price: 20,
    discount: 13,
    sizes: ['S', 'M', 'L'],
    colors: ['Purple', 'Yellow', 'Gold'],
  ),
];
