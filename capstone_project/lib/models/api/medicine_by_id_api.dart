import 'dart:convert';
import 'package:capstone_project/models/medicine_id_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class MedicineIdAPI {
  static final Urls baseUrl = Urls();

  static Future<Medicine?> getMedicine(int id) async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    try {
      final response = await dio.get('${Urls.baseUrl}/users/medicines/$id');
      final data = medicineFromJson(json.encode(response.data));

      if (response.statusCode == 200) {
        return data;
      } else {
        // Handle other cases, including 401
        if (response.statusCode == 401) {
          return data;
        } else {
          return data;
        }
      }
    } catch (error) {
      rethrow;
    }
  }
}
