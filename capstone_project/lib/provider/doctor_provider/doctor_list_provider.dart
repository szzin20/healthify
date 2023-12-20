import 'package:flutter/material.dart';
import 'package:capstone_project/models/doctor_list_model.dart';
import 'package:capstone_project/models/api/doctor_list_limit_api.dart';

class DoctorsListProvider extends ChangeNotifier {
  List<Result> _doctorsList = [];

  List<Result> get doctorsList => _doctorsList;

  Future<void> fetchDoctorsList() async {
    try {
      _doctorsList = await ListDoctorsAPI.getSearchData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
