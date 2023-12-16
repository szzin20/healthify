import 'package:capstone_project/models/cart_model.dart';
import 'package:capstone_project/models/helper/database_helper.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:flutter/material.dart';

class CartDatabaseProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Result> _cartItems = [];
  List<MedicineDetail> _cartDetail = [];

  List<Result> get cartItems => _cartItems;

  Future<void> addToCart(Result medicine) async {
    await _databaseHelper.insertToCart(medicine);
    _updateCart();
  }

  Future<void> getCartItems() async {
    _cartItems = await _databaseHelper.getCartItems();
    notifyListeners();
  }
  Future<List<MedicineDetail>> getMedicineDetail() async {
    return _cartDetail = await _databaseHelper.getAllMedicineDetails();
  }

  Future<void> updateCartItem(Result medicine) async {
    await _databaseHelper.updateCartItem(medicine);
    _updateCart();
  }

  Future<void> removeFromCart(int id) async {
    await _databaseHelper.removeFromCart(id);
    _updateCart();
  }

  Future<void> clearCart() async {
    await _databaseHelper.clearCart();
    _updateCart();
  }

  Future<void> addQuantity(int id) async {
    await _databaseHelper.addQuantity(id);
    _updateCart();
  }

Future<void> removeQuantity(int id) async {
    List<Result> cartItems = await _databaseHelper.getCartItems();

    Result cartProduct = cartItems.firstWhere((item) => item.id == id);

    await _databaseHelper.updateCartItem(
      cartProduct.copyWith(quantity: cartProduct.quantity - 1),
    );

    _updateCart();
  }


  Future<void> removeAllQuantity(int id) async {
    await _databaseHelper.removeAllQuantity(id);
    _updateCart();
  }

int countMedQuantity(int id) {
    return _cartItems.firstWhere((item) => item.id == id).quantity;
  }


  void _updateCart() {
    getCartItems();
  }
}
