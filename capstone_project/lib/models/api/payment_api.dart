// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:capstone_project/utils/utils.dart';
// import 'package:mime/mime.dart';

// Future<bool> uploadProfileImage({
//   required int doctorId,
//   required File image,
//   required String selectedPaymentMethod,
// }) async {
//   try {
//     await SharedPreferencesUtils.init();
//     String token = SharedPreferencesUtils.getToken();
//     String fileName = image.path.split('/').last;
//     String baseUrl = Urls.baseUrl;

//     // Get mimeType dynamically from the image_picker package
//     String mimeType = mime(image.path) ?? 'application/octet-stream';

//     Response response = await Dio().post(
//       '$baseUrl${Urls.doctortransactions.replaceFirst(':doctor_id', doctorId.toString())}',
//       options: Options(
//         headers: {
//           "authorization": "Bearer $token",
//           'Content-Type': 'multipart/form-data',
//         },
//       ),
//       data: FormData.fromMap({
//         'payment_method': selectedPaymentMethod,
//         'payment_confirmation': await MultipartFile.fromFile(
//           image.path,
//           filename: fileName,
//           contentType: MediaType.parse(mimeType), // Use dynamic mimeType
//         ),
//       }),
//     );

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw 'Failed to upload image';
//     }
//   } on DioError catch (e) {
//     throw '${e.response?.data['message']}';
//   }
// }
