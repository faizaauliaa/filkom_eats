import 'cart_item.dart';

class Order {
  final DateTime date;
  final List<CartItem> items;

  Order({required this.date, required this.items});

  int get total {
    return items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}
