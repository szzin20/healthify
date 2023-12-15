import 'package:capstone_project/models/medicine_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Result> _cartList = [];
  List<Result> get cartList => _cartList;

  final Set<Result> _cartSet = {};
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

  void addQuantity(Result result) {
    _cartList.add(result);
    notifyListeners();
  }

  void removeQuantity(Result result) {
    // ignore: collection_methods_unrelated_type
    _cartList.remove(result);
    notifyListeners();
  }

  void removeAllQuantity(int id) {
    _cartList.removeWhere((result) => result.id == id);
    _cartSet.removeWhere((result) => result.id == id);
    notifyListeners();
  }
}
