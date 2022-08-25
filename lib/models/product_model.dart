import 'package:ecommerce_app/utils/assets.dart';

class Product {
  final String category;
  final int? discount;
  final String id;
  final String imageUrl;
  final double price;
  final double? rate;
  final String title;
  final bool isFavorite;
  final List<String> sizes;
  final List<String> colors;
  final int? qty;
  final String? selColor;
  final String? selSize;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    required this.sizes,
    required this.colors,
    this.rate,
    this.discount = 1,
    this.qty,
    this.selColor,
    this.selSize,
  });
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
