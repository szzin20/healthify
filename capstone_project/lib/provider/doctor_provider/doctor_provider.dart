// ignore_for_file: unused_field, prefer_final_fields, empty_catches

import 'package:capstone_project/models/doctor_model.dart';
import 'package:capstone_project/provider/doctor_provider/menu_doctor_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DoctorProvider extends ChangeNotifier {
  static const String baseUrl = "https://api.healthify.my.id/users/doctors";
  static const String availableDoctorsUrl = "$baseUrl/available";
  static const String filteredDoctorsUrl = "$baseUrl?limit=5&offset=0";

  final Dio _dio = Dio();
  List<Doctor> _doctors = [];
  List<Doctor> _searchDoctors = [];
  List<Doctor> _filteredDoctors = [];
  int _selectedMenuIndex = 0;
  VoidCallback? _menuIndexChangedCallback;

  Future<void> fetchDoctor() async {
    try {
      Response response =
          await _dio.get("$availableDoctorsUrl?limit=10&offset=0");
      final List<dynamic> results = response.data['results'];
      _doctors = results.map((json) => Doctor.fromJson(json)).toList();
      _filteredDoctors = List.from(_doctors);
      notifyListeners();
    } catch (error) {}
  }

  Future<void> fetchFilterDoctor(String specialization) async {
    try {
      final Response response = await _dio.get(
        "$filteredDoctorsUrl&specialist=$specialization",
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        _doctors = results.map((json) => Doctor.fromJson(json)).toList();
        _filteredDoctors = List.from(_doctors);
        notifyListeners();
      } else if (response.statusCode == 404) {
        // Handle the case when no doctors are found
        _doctors = [];
        _filteredDoctors = [];
        notifyListeners();
      } else {
        _doctors = [];
        _filteredDoctors = [];
        notifyListeners();
      }
    } catch (error) {
      _doctors = [];
      _filteredDoctors = [];
      notifyListeners();
    }
  }

  List<Doctor> searchDoctor(String keyword) {
    // Bersihkan hasil pencarian sebelumnya
    _filteredDoctors.clear();

    // Jika _doctors tidak null, filter dokter berdasarkan kata kunci pencarian
    _filteredDoctors = _doctors
        .where((doctor) =>
            doctor.fullname.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  
    // Notifikasi perubahan kepada listener
    notifyListeners();

    return _filteredDoctors;
  }

  List<Doctor> get filteredDoctors => _filteredDoctors;

  void setMenuIndex(int index) {
    if (index < 0 || index >= MenuProvider().doctorItems.length) {
      return;
    }
    final selectedSpecialization = filterSpecializations[index];
    fetchFilterDoctor(selectedSpecialization);
  }

  final List<String> filterSpecializations = [
    'Kardiovaskular',
    'Jantung', 
    'Pulmonologis',
    'Imunologi',
    'Infeksiologis',
    'Oftalmologis',
    'Gigi',
  ];

  int get selectedMenuIndex => _selectedMenuIndex;

  void setMenuIndexChangedCallback(VoidCallback callback) {
    _menuIndexChangedCallback = callback;
  }
}
