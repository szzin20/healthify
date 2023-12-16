import 'package:flutter/material.dart';

class CheckPaymentInfoProvider extends ChangeNotifier {
  String name = '';
  String address = '';
  String phone = '';
  bool delivery = false;

  String get fullName => name;
  String get fullAddress => address;
  String get phoneNo => phone;

  fetchName(String nameText) {
    name = nameText;
    notifyListeners();
  }
  fetchAddress(String addressText) {
    address = addressText;
    notifyListeners();
  }
  fetchPhoneNo(String phoneNumber) {
    phone = phoneNumber;
    notifyListeners();
  }
  fetchDelivery(bool newDelivery) {
    delivery = newDelivery;
    notifyListeners();
  }
}