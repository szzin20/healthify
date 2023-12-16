import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
class StatusTransactionApi {
  final Dio _dio = Dio(); // Adjust Dio configuration as needed

  StatusTransactionApi() {
    // Example: Add authentication token to headers
    _dio.options.headers['Authorization'] = 'Bearer your_access_token';
  }

  Future<Map<String, dynamic>?> getStatusTransaction(int limit) async {
    try {
      final response = await _dio.get(
        'https://dev.healthify.my.id${Urls.doctortransactionsbystatus}',
        queryParameters: {'limit': limit},
      );

      return response.data as Map<String, dynamic>?; // Use nullable type
    } catch (error) {
      print('Error loading status transaction: $error');
      return null; // Return null in case of an error
    }
  }
}
