import 'package:flutter/material.dart';

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  // Method to add item to cart
  void addtoCart(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  // Method to clear cart
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
