import 'package:flutter/material.dart';
import 'package:petsrology/product/product_model/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    for (var item in _items) {
      // Extract numeric value from price string (e.g., "$5.99" -> 5.99)
      String priceString = item.product.price.replaceAll('\$', '');
      double price = double.tryParse(priceString) ?? 0.0;
      total += price * item.quantity;
    }
    return total;
  }

  void addItem(ProductModel product, int quantity) {
    final existingIndex = _items.indexWhere((item) => item.product.name == product.name);
    
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item.product.name == productName);
    notifyListeners();
  }

  void updateQuantity(String productName, int quantity) {
    final existingIndex = _items.indexWhere((item) => item.product.name == productName);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity = quantity;
      notifyListeners();
    }
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}