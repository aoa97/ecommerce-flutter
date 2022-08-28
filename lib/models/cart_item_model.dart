class CartItem {
  final String id;
  final String title;
  final double price;
  final int qty;
  final String size;
  final String color;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty,
      required this.color,
      required this.size});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'qty': qty,
      'size': size,
      'color': color,
    };
  }
}
