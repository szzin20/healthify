import 'dart:convert';
import 'package:capstone_project/models/checkout_list_model.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class CheckOutApi {
  static Future<OrderMed?> checkoutItem(
    CheckoutItemRequest request,
    String token,
  ) async {
    final Dio dio = Dio();
    dio.options.validateStatus = (status) => true;

    try {
      final response = await dio.post(
        '${Urls.baseUrl}/users/medicines-payments',
        data: request.toJson(),
        options: Options(
          headers: {
            "authorization": "bearer $token",
          },
        ),
      );
      final data = orderMedFromJson(json.encode(response.data));

      if (response.statusCode == 200) {
        return data;
      } else {
        if (response.statusCode == 401) {
          print("Unauthorized access: ${response.data}");
          return data;
        } else {
          print("Error: ${response.statusCode}");
          return data;
        }
      }
    } catch (error) {
      print("Error: $error");
    }
    return null;
  }
}
