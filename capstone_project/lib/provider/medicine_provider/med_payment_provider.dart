import 'package:capstone_project/models/api/checkout_medicine_api.dart';
import 'package:capstone_project/models/checkout_list_model.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:flutter/material.dart';

class MedPaymentProvider extends ChangeNotifier {
  OrderMed? _dataOrder;

  OrderMed? get login => _dataOrder;

  Future<void> sendOrderMed(CheckoutItemRequest data, String token) async {
    try {
      final orderMed = await CheckOutApi.checkoutItem(data, token);
      _dataOrder = orderMed;
      notifyListeners();
    } catch (e) {
      _dataOrder = null;
    }
  }
}
