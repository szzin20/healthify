import 'dart:convert';


import 'package:capstone_project/models/pay_med_history_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class HistoryMedTransactionApi {
  static Future<PayMedHistory?> getMedTransaction() async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    String token = SharedPreferencesUtils.getToken();
    try {
      final response = await dio.get(
        '${Urls.baseUrl}/users/medicines-payments/checkout?offset=0&limit=50',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return payMedHistoryFromJson(json.encode(response.data));
    } catch (error) {
      return null;
    }
  }
}
