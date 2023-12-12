import 'dart:convert';
import 'package:capstone_project/models/doctor_data_model.dart'; // Import your Doctor model
import 'package:capstone_project/utils/utils.dart'; // Import your utility classes
import 'package:dio/dio.dart';

class DoctorAPI {
  static Future<Results> getDoctorData(int doctorId) async {
    Results doctorData;
    try {
      final response = await Dio().get('${Urls.baseUrl}${Urls.byid}$doctorId');
       final data = doctorFromJson(json.encode(response.data));
      doctorData = data.results;
    } catch (e) {
      rethrow;
    }
    return doctorData;
  }
}
