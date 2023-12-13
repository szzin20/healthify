import 'dart:convert';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:dio/dio.dart';

class ArticleListAPI {
  static final Urls baseUrl = Urls();

  static Future<List<Result>> getArticles() async {
    List<Result> listArticlesData = [];
    try {
      final response = await Dio().get('${Urls.baseUrl}${Urls.allarticles}');
      final data = listArticlesFromJson(json.encode(response.data));
      listArticlesData = data.results;
    } catch (e) {
      rethrow;
    }
    return listArticlesData;
  }
}
