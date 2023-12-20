import 'package:capstone_project/models/api/medicine_list_api.dart';
import 'package:capstone_project/models/medicine_model.dart';
import 'package:flutter/material.dart';

class AllMedicineProvider with ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<Result> _medicine = [];
  List<Result> _searchResults = [];

  List<Result> get medicine => _medicine;

  Future<void> fetchMedicine() async {
    try {
      _medicine = await AllListMedicinesAPI.getData();
      notifyListeners();
    } catch (e) {
      // Handle error as needed
      rethrow;
    }
  }

  // Metode untuk mengambil daftar obat hasil pencarian
  List<Result> searchMedicine(String keyword) {
    // Bersihkan hasil pencarian sebelumnya
    _searchResults.clear();

    // Filter obat berdasarkan kata kunci pencarian
    _searchResults = _medicine
        .where((med) => med.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    // Schedule the notifyListeners() call to be executed after the frame is painted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Notifikasi perubahan kepada listener
      notifyListeners();
    });

    return _searchResults;
  }
}
