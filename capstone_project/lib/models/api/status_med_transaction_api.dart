import 'dart:convert';

import 'package:capstone_project/models/med_tran_detail_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class StatusMedTransactionApi {
  
  static Future<MedTranDetail?> getStatusTransaction(int id) async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    String token = SharedPreferencesUtils.getToken();
    try {
      final response =
          await dio.get('${Urls.baseUrl}/users/medicines-payments/checkout/$id',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      return medTranDetailFromJson(json.encode(response.data));
    } catch (error) {
      return null; // Return null in case of an error
    }
  }
}
