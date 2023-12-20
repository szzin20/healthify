import 'dart:convert';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class AllArticleListAPI {
  static final Urls baseUrl = Urls();

  static Future<ListArticles?> getArticles() async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => true;
    try {
      final response = await dio.get('${Urls.baseUrl}${Urls.articles}');
      final data = listArticlesFromJson(json.encode(response.data));

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

  static final Dio _dio = Dio();

  static Future<ListArticles> getArticlesByTitle(String query) async {
    try {
      final response = await _dio
          .get('https://api.healthify.my.id/users/article', queryParameters: {
        'title': query,
        'offset': 0,
        'limit': 10,
      });

      if (response.statusCode == 200) {
        return ListArticles.fromJson(response.data);
      } else {
        throw Exception('Failed to load articles by title');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
