import 'dart:convert';

import 'package:capstone_project/models/chatbot_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatBotApi {
  static Future<ChatBotModel> postChatBot(String message) async {
    ChatBotModel? results;
    final String data = '''{\n    "request": "$message"\n}''';

    try {
      final response = await Dio().post(
        '${Urls.baseUrl}${Urls.chatbots}',
        data: data,
      );
      final chatBotModel = chatBotModelFromJson(jsonEncode(response.data));
      results = chatBotModel;
      return results;
    } on DioException catch (e) {
      debugPrint(
          'statuscode: ${e.response?.statusCode}, statusmessage: ${e.response?.statusMessage}');
      debugPrint(
          'success: ${results?.meta.success}, message: ${results?.meta.message}');
      throw Exception(results);
    }
  }
}
