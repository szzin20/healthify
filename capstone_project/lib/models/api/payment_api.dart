import 'dart:convert';
import 'dart:io';
import 'package:capstone_project/models/pay_doc_detail.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:capstone_project/utils/utils.dart';

Future<PayDoc?> uploadPaymentTransaction({
  required int doctorId,
  required File image,
  required String selectedPaymentMethod,
}) async {
  try {
    await SharedPreferencesUtils.init();
    String token = SharedPreferencesUtils.getToken();
    String fileName = image.path.split('/').last;
    String baseUrl = Urls.baseUrl;
    

    // Check if the image file exists
    if (!image.existsSync()) {
      throw 'Image file does not exist: ${image.path}';
    }

    Response response = await Dio().post(
      '$baseUrl${Urls.doctortransactions.replaceFirst(':doctor_id', doctorId.toString())}',
      options: Options(
        headers: {
          "authorization": "Bearer $token",
          'Content-Type': 'multipart/form-data',
        },
      ),
      data: FormData.fromMap({
        'payment_method': selectedPaymentMethod.toLowerCase(),
        'payment_confirmation': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      }),
    );

    if (response.statusCode == 201) {
      return payDocFromJson(json.encode(response.data));// Return true on success
    } else {
      return payDocFromJson(json.encode(response.data)); // Return false on failure
    }

  } catch (e) {
    print("Error uploading payment: $e");
    return null; // Return false for other exceptions
  }
}
