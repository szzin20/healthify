import 'dart:convert';
import 'package:capstone_project/models/register_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class GetRegisterData {
  static Future<RegisterData?> postRegister(
      String fullname, String email, String password) async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => true;

    try {
      Response response = await dio.post(
        '${Urls.baseUrl}${Urls.register}',
        data: {
          'fullname': fullname,
          'email': email,
          'password': password,
        },
      );

      final data = jsonDecode(jsonEncode(response.data));
      return RegisterData.fromJson(data);
    } on DioException {
      return null;
    }
  }
}
