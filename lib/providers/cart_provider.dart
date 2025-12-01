import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  // map key = product.id, value = CartItem
  final Map<String, CartItem> _items = {};

  // expose sebagai Map dan List helper
  Map<String, CartItem> get items => _items;
  List<CartItem> get itemsList => _items.values.toList();

  int get totalItems {
    int total = 0;
    _items.forEach((_, item) => total += item.quantity);
    return total;
  }

  int get totalPrice {
    int total = 0;
    _items.forEach((_, item) => total += item.product.price * item.quantity);
    return total;
  }

  void add(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    if (!_items.containsKey(product.id)) return;

    final current = _items[product.id]!;
    if (current.quantity > 1) {
      current.quantity--;
    } else {
      _items.remove(product.id);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
