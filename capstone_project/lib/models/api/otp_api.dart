// ignore_for_file: use_build_context_synchronously
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OtpApi {
  final Dio _dio = Dio();

  Future<bool> createOTP(String email) async {
    try {
      Response response = await _dio.post(
        '${Urls.baseUrl}/users/get-otp',
        data: {'email': email},
      );
      return response.data['success'] ?? false;
    } catch (error) {
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String otp) async {
    try {
      Response response = await _dio.post(
        '${Urls.baseUrl}/users/',
        data: {'email': email, 'otp': otp},
      );
      return response.data['success'] ?? false;
    } catch (error) {
      return false;
    }
  }

  Future<void> registerUser(
      BuildContext context, String email, String otp) async {
    try {
      Response response = await _dio.post(
        '${Urls.baseUrl}/users/OTP-verification',
        data: {'email': email, 'otp': otp},
      );

      if (response.data['meta']['success'] ?? false) {
        // Registration successful, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        return;
      }
    } on DioException {
      return;
    }
  }
}
