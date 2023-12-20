import 'package:capstone_project/models/api/doctors_list_api.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/models/doctor_list_model.dart';

class DoctorsListProvider extends ChangeNotifier {
  List<Result> _doctorsList = [];

  List<Result> get doctorsList => _doctorsList;

  Future<void> fetchDoctorsList() async {
    try {
      _doctorsList = await AllListDoctorsAPI.getSearchData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
