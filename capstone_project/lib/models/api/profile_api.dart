import 'dart:convert';

import 'package:capstone_project/models/profile_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileApi {
  /// GET USER PROFILE
  static Future<Profile?> getUserProfile({required String authToken}) async {
    Profile? userData;
    final token = SharedPreferencesUtils.getToken();

    try {
      final response = await Dio().get(
        '${Urls.baseUrl}${Urls.profile}',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      userData = Profile.fromJson(response.data);
    } on DioException catch (e) {
      final errorModel = profileModelFromJson(jsonEncode(e.response?.data));

      if (e.response?.statusCode == 401) {
        debugPrint(
            'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

        debugPrint(
            'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

        final errorMessageModel = errorModel.meta.message;
        debugPrint(errorMessageModel);
        throw errorMessageModel;
      } else if (e.response?.statusCode == 500) {
        if (errorModel.meta.message == "Invalid or Expired Token") {
          debugPrint(
              'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

          debugPrint(
              'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

          final errorMessageModel = errorModel.meta.message;
          debugPrint(errorMessageModel);
          throw errorMessageModel;
        } else if (errorModel.meta.message == "Missing Token") {
          debugPrint(
              'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

          debugPrint(
              'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

          final errorMessageModel = errorModel.meta.message;
          debugPrint(errorMessageModel);
          throw errorMessageModel;
        }
      }
    }
    return userData;
  }

  /// UPDATE USER PROFILE
  static Future<Profile?> updateUserProfile({required String authToken}) async {
    Profile? userData;
    final token = SharedPreferencesUtils.getToken();

    try {
      final response = await Dio().put(
        '${Urls.baseUrl}${Urls.profile}',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      userData = Profile.fromJson(response.data);
    } on DioException catch (e) {
      final errorModel = profileModelFromJson(jsonEncode(e.response?.data));

      if (e.response?.statusCode == 401) {
        debugPrint(
            'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

        debugPrint(
            'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

        final errorMessageModel = errorModel.meta.message;
        debugPrint(errorMessageModel);
        throw errorMessageModel;
      } else if (e.response?.statusCode == 500) {
        if (errorModel.meta.message == "Invalid or Expired Token") {
          debugPrint(
              'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

          debugPrint(
              'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

          final errorMessageModel = errorModel.meta.message;
          debugPrint(errorMessageModel);
          throw errorMessageModel;
        } else if (errorModel.meta.message == "Missing Token") {
          debugPrint(
              'success: ${errorModel.meta.success}, message: ${errorModel.meta.message}');

          debugPrint(
              'Error ${e.response?.statusCode} ${e.response?.statusMessage}');

          final errorMessageModel = errorModel.meta.message;
          debugPrint(errorMessageModel);
          throw errorMessageModel;
        }
      }
    }
    return userData;
  }
}
