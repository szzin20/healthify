import 'package:capstone_project/models/login_data_model.dart';
import 'package:flutter/material.dart';

class DoctorByIdProvider extends ChangeNotifier {
  LoginData? _dataLogin;

  LoginData? get doctor => _dataLogin;

  Future<void> fetchDoctorData(int doctorId) async {
    try {
      final doctorData = await DoctorAPI.getDoctorData(doctorId);
      _dataLogin = doctorData;
      notifyListeners();
      print('object');
    } catch (e) {
      print('Error fetching doctor data: $e');
    }
  }
}
