import 'package:capstone_project/models/medicine_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MedicineProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<Medicine> medicines = [];

  Future<void> fetchMedicines() async {
    try {
      Response response = await _dio.get("http://34.101.122.152/users/medicines?offset=0&limit=5");
      final List<dynamic> results = response.data['results'];
      medicines = results.map((json) => Medicine.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      // ignore: avoid_print
      print("Error fetching medicines: $error");
    }
  }
}
