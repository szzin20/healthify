import 'dart:convert';

import 'package:capstone_project/models/pay_doc_detail.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class StatusTransactionApi {
  
  static Future<PayDoc?> getStatusTransaction(int id) async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    String token = SharedPreferencesUtils.getToken();
    try {
      final response =
          await dio.get('${Urls.baseUrl}/users/doctor-payments/$id',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));
      return payDocFromJson(json.encode(response.data));
    } catch (error) {
      return null; // Return null in case of an error
    }
  }
}
