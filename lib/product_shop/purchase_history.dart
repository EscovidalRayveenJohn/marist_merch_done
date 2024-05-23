import 'package:flutter/material.dart';
import 'package:maristcommerce/product_shop/cart_detail.dart';

class PurchaseEntry {
  final String productName;
  final double price;
  final int quantity;

  PurchaseEntry({
    required this.productName,
    required this.price,
    required this.quantity,
  });
}

class PurchaseHistory extends ChangeNotifier {
  List<PurchaseEntry> _purchaseHistory = [];

  List<PurchaseEntry> get purchaseHistory => _purchaseHistory;

  void addPurchaseEntry(CartItem cartItem) {
    _purchaseHistory.add(PurchaseEntry(
      productName: cartItem.name,
      price: cartItem.price,
      quantity: cartItem.quantity,
    ));
    notifyListeners();
  }

  void clearPurchaseHistory() {
    _purchaseHistory.clear();
    notifyListeners();
  }
}
