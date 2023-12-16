import 'dart:convert';
import 'package:capstone_project/models/register_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class GetRegisterData {
  static Future<RegisterData?> postRegister(String fullname, String email, String password) async {
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

      print('${Urls.baseUrl}${Urls.register}');
      print("Server Response: ${response.statusCode} - ${response.data}");

      if (response.statusCode == 200) {
        final data = jsonDecode(jsonEncode(response.data));
        return RegisterData.fromJson(data);
      } else {
        // Handle other cases, including 401
        if (response.statusCode == 401) {
          print("Unauthorized access: ${response.data}");
          return null;
        } else {
          print("Error: ${response.statusCode} - ${response.data}");
          return null;
        }
      }
    } catch (error) {
      print("Error: $error");
    }

    return null;
  }
}
