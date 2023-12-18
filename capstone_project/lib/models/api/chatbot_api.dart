import 'dart:convert';

import 'package:capstone_project/models/chatbot_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatBotApi {
  /// POST CUSTOMER SERVICE
  static Future<ChatBotModel> postChatBotCS(String message) async {
    ChatBotModel? results;
    final String data = '''{\n    "request": "$message"\n}''';

    try {
      final response = await Dio().post(
        '${Urls.baseUrl}${Urls.cschatbot}',
        data: data,
      );
      final chatBotModel = chatBotModelFromJson(jsonEncode(response.data));
      results = chatBotModel;
      debugPrint(results.results);
      return results;
    } on DioException catch (e) {
      debugPrint(
          'statuscode: ${e.response?.statusCode}, statusmessage: ${e.response?.statusMessage}');
      debugPrint(
          'success: ${results?.meta.success}, message: ${results?.meta.message}');

      if (results?.meta.success == false) {
        throw Exception('${results?.meta.message}');
      }
      throw Exception('Maaf, saya tidak tahu jawabannya');
    }
  }

  /// POST CHATBOT
  static Future<ChatBotModel> postChatBot(String message) async {
    ChatBotModel? results;

    final String data = '''{\n    "request": "$message"\n}''';

    try {
      final response = await Dio().post(
        '${Urls.baseUrl}${Urls.chatbot}',
        data: data,
      );
      final chatBotModel = chatBotModelFromJson(jsonEncode(response.data));
      results = chatBotModel;
      debugPrint(results.results);
      return results;
    } on DioException catch (e) {
      debugPrint(
          'statuscode: ${e.response?.statusCode}, statusmessage: ${e.response?.statusMessage}');
      debugPrint(
          'success: ${results?.meta.success}, message: ${results?.meta.message}');

      if (e.response?.statusCode == 400) {
        if (results?.meta.message == "failed to get recommendation") {
          debugPrint("Error: Jawaban tidak tersedia");
          throw Exception(results?.results);
        }
        debugPrint("Error: Request body ada yg salah");
        throw Exception("Maaf, terjadi kesalahan!");
      }
      throw Exception(results?.results);
    }
  }
}
