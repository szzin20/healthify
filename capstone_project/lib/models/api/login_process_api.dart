import 'dart:convert';

import 'package:capstone_project/models/login_data_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class GetLoginData {
  static Future<LoginData?> postLogin(String email, String pass) async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => true; 

    try {
      Response response = await dio.post(
        '${Urls.baseUrl}${Urls.signIn}',
        data: {
          'email': email,
          'password': pass,
        },
      );

      final data = loginDataFromJson(jsonEncode(response.data));

      if (response.statusCode == 200) {
        return data;
      } else {
        // Handle other cases, including 401
        if (response.statusCode == 401) {
          return data;
        } else {
          return data;
        }
      }
    } catch (error) {
      rethrow;
    }
  }
}
