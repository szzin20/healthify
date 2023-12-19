import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class StatusTransactionApi {
  static Future<Map<String, dynamic>?> getStatusTransaction(
    int id,
  ) async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    String token = SharedPreferencesUtils.getToken();
    try {
      final response =
          await dio.get('${Urls.baseUrl}/users/medicines-payments/checkout/$id',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      return response.data as Map<String, dynamic>?; // Use nullable type
    } catch (error) {
      print('Error loading status transaction: $error');
      return null; // Return null in case of an error
    }
  }
}
