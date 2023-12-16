import 'package:flutter/material.dart';
import 'package:capstone_project/models/doctor_data_model.dart';
import 'package:capstone_project/models/api/doctor_by_id_api.dart';

class DoctorByIdProvider extends ChangeNotifier {
  Results? _doctor;

  Results? get doctor => _doctor;

  Future<void> fetchDoctorData(int doctorId) async {
    try {
      final doctorData = await DoctorAPI.getDoctorData(doctorId);
      _doctor = doctorData;
      notifyListeners();
      // ignore: avoid_print
      print('Doctor data fetched successfully');
    } catch (e, stackTrace) {
      // Print the error and stack trace
      // ignore: avoid_print
      print('Error fetching doctor data: $e\n$stackTrace');
    }
  }
}
