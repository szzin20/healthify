import 'dart:convert';

import 'package:capstone_project/models/medicine_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class AllListMedicinesAPI {

  static Future<List<Result>> getData() async {
    List<Result> listMedicinesData = [];
    try {
      final response = await Dio().get(
          '${Urls.baseUrl}${Urls.allmedicines}');
      final data = medicineFromJson(json.encode(response.data));
      listMedicinesData = data.results;
    } catch (e) {
      rethrow;
    }
    return listMedicinesData;
  }
}