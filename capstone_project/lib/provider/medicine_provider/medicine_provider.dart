import 'package:capstone_project/models/api/medicine_list_api.dart';
import 'package:capstone_project/models/medicine_model.dart';
import 'package:flutter/material.dart';


class AllMedicineProvider with ChangeNotifier {
  List<Result> _medicine = [];

  List<Result> get medicine => _medicine;

  Future<void> fetchMedicine() async {
    try {
      _medicine = await AllListMedicinesAPI.getData();
      notifyListeners();
    } catch (e) {
      // Handle error as needed
      print('Error fetching articles: $e');
    }
  }
}
