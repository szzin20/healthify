
import 'package:capstone_project/models/api/medicine_by_id_api.dart';
import 'package:capstone_project/models/medicine_id_model.dart';
import 'package:flutter/material.dart';

class MedicineByIdProvider with ChangeNotifier {
  Medicine? _medicines;
  bool _loading = true;

  Medicine? get medicines => _medicines;
  bool get loading => _loading;

  Future<void> fetchMedicines(int id) async {
    try {
      _medicines = await MedicineIdAPI.getMedicine(id);
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}