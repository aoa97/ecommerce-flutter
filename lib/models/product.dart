import 'package:ecommerce_app/utils/assets.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final double price;
  final String imageUrl;
  final double? rate;
  final int? discount;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.rate,
    this.discount,
  });
}

List<Product> productsList = [
  Product(
      id: '1',
      title: "Dorothy Perkins",
      category: "Evening Dress",
      imageUrl: AppAssets.product_1,
      price: 12,
      discount: 10),
  Product(
      id: '2',
      title: "Mango",
      category: "Pullover",
      imageUrl: AppAssets.product_1,
      price: 51,
      discount: 20),
  Product(
      id: '3',
      title: "Sitlly",
      category: "Sport Dress",
      imageUrl: AppAssets.product_1,
      price: 19,
      discount: 15),
  Product(
      id: '4',
      title: "Metropolis",
      category: "Blouse",
      imageUrl: AppAssets.product_1,
      price: 16,
      discount: 8),
  Product(
      id: '5',
      title: "Topshop",
      category: "Shirt",
      imageUrl: AppAssets.product_1,
      price: 20,
      discount: 13),
];
