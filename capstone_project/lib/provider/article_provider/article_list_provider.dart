import 'package:capstone_project/models/api/article_list_limit_api.dart';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:flutter/material.dart';


class ArticlesListProvider with ChangeNotifier {
  List<Result> _articles = [];

  List<Result> get articles => _articles;

  Future<void> fetchArticles() async {
    try {
      _articles = await ArticleListAPI.getArticles();
      notifyListeners();
    } catch (e) {
      // Handle error as needed
      print('Error fetching articles: $e');
    }
  }
}
