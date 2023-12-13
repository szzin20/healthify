import 'package:flutter/material.dart';
import 'package:capstone_project/models/doctor_data_model.dart'; // Import your Doctor model
import 'package:capstone_project/models/api/doctor_by_id_api.dart'; // Import your DoctorAPI

class DoctorByIdProvider extends ChangeNotifier {
  Results? _doctor;

  Results? get doctor => _doctor;

  Future<void> fetchDoctorData(int doctorId) async {
    try {
      final doctorData = await DoctorAPI.getDoctorData(doctorId);
      _doctor = doctorData;
      notifyListeners();
      print('object');
    } catch (e) {
      print('Error fetching doctor data: $e');
    }
  }
}
