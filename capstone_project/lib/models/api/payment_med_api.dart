import 'dart:io';

import 'package:capstone_project/models/paymed_model.dart';
import 'package:dio/dio.dart';
import 'package:capstone_project/utils/utils.dart';

class PaymentAPI {
  final Dio _dio = Dio();

  Future<PayMed> createPayment({
    required int checkoutId,
    required File image,
    required String paymentConfirmationPath,
  }) async {
    final String url = '${Urls.baseUrl}/users/medicines-payments/checkout?medicine_transaction_id=$checkoutId';
    String token = SharedPreferencesUtils.getToken();

    final String fileName = paymentConfirmationPath.split('/').last;

    try {
      FormData formData = FormData.fromMap({
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

      PayMed riwayatTransaksiModel =
          PayMed.fromJson(response.data);

      return riwayatTransaksiModel;
    } catch (e) {
      throw Exception('Failed to make payment $e');
    }
  }
}