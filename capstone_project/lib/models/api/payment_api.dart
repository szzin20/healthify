import 'package:dio/dio.dart';
import 'package:capstone_project/utils/utils.dart';

class PaymentAPI {
  final Dio _dio = Dio();

  Future<void> createPayment({
    required int doctorId,
    required String paymentMethod,
    required String paymentConfirmationPath,
  }) async {
    final String url = '${Urls.baseUrl}/users/doctor-payments/$doctorId';
    String token = SharedPreferencesUtils.getToken();

    final String fileName = paymentConfirmationPath.split('/').last;

    print(doctorId);
    print(paymentMethod);
    print(paymentConfirmationPath);

    try {
      FormData formData = FormData.fromMap({
        'payment_method': paymentMethod.toLowerCase(),
        'payment_confirmation': await MultipartFile.fromFile(
          paymentConfirmationPath,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Handle the API response as needed
      // ignore: avoid_print
      print(response.data);
    } catch (e) {
      print(e);
      throw Exception('Failed to make payment $e');
    }
  }
}
