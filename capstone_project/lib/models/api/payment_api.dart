import 'package:dio/dio.dart';
import 'package:capstone_project/utils/utils.dart';

class PaymentAPI {
  final Dio _dio = Dio();

  Future<void> createPayment({
    required String paymentMethod,
    required String paymentConfirmationPath,
  }) async {
    const String url = 'http://34.101.122.152/users/doctor-payments/1'; 
    String token = SharedPreferencesUtils.getToken();

    try {
      FormData formData = FormData.fromMap({
        'payment_method': paymentMethod,
        'payment_confirmation': await MultipartFile.fromFile(
          paymentConfirmationPath,
          filename: 'payment_confirmation.jpg', 
        ),
      });

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Handle the API response as needed
      // ignore: avoid_print
      print(response.data);
    } catch (e) {
      throw Exception('Failed to make payment $e');
    }
  }
}
