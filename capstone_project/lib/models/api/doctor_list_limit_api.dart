import 'dart:convert';

import 'package:capstone_project/models/doctor_list_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class ListDoctorsAPI {

  static Future<List<Result>> getSearchData() async {
    List<Result> listDoctorsData = [];
    try {
      final response = await Dio().get(
          '${Urls.baseUrl}${Urls.avilabledoctors}');
      final data = listDoctorsFromJson(json.encode(response.data));
      listDoctorsData = data.results;
    } catch (e) {
      rethrow;
    }
    return listDoctorsData;
  }
}