class CartItem {
  final String? id;
  final int qty;
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final String size;
  final String color;

  CartItem(
      {this.id,
      this.qty = 1,
      required this.productId,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.color,
      required this.size});

  Map<String, dynamic> toMap() {
    return {
      'qty': qty,
      'productId': productId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'size': size,
      'color': color,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map, String documentId) {
    return CartItem(
      id: documentId,
      productId: map['productId'] ?? '',
      qty: map['qty'] ?? 0,
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'].toDouble(),
      color: map['color'] ?? '',
      size: map['size'] ?? '',
    );
  }
}
