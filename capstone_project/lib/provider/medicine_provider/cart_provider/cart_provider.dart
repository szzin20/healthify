import 'package:capstone_project/models/medicine_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Result> _cartList = [];
  List<Result> get cartList => _cartList;

  Set<Result> _cartSet = {};
  Set<Result> get cartSet => _cartSet;

  void addMedToCart() {
    for (Result value in _cartList) {
      _cartSet.add(value);
    }
    notifyListeners();
  }

  int countMedQuantity(int id) {
    final cart = _cartList.where((result) => result.id == id);
    final cartList = cart.toList();
    return cartList.length;
  }
}
