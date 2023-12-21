import 'dart:convert';

import 'package:capstone_project/models/pay_doc_history_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class HistoryDocTransactionApi {
  static Future<PayDocHistory?> getDocTransaction() async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    String token = SharedPreferencesUtils.getToken();
    try {
      final response = await dio.get(
        '${Urls.baseUrl}/users/doctor-payments?offset=0&limit=50',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      return payDocHistoryFromJson(json.encode(response.data));
    } catch (error) {
      return null;
    }
  }
}
