import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterApi {
  final Dio _dio = Dio();

  Future<Response> postData({required Map<String, dynamic> dataRegister}) async {
    try {
      final postResponse = await _dio.post(
        'http://34.101.122.152/users/register',
        data: dataRegister,
      );

      debugPrint(postResponse.data.toString());
      return postResponse;
    } catch (e) {
     throw Exception(e);
    }
  }
}
