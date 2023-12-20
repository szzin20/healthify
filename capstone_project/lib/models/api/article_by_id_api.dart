import 'dart:convert';
import 'package:capstone_project/models/article_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class ArticleIdAPI {
  static final Urls baseUrl = Urls();

  static Future<Article?> getArticles(int id) async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    try {
      final response = await dio.get('${Urls.baseUrl}/users/articles/$id');
      final data = articleFromJson(json.encode(response.data));

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
