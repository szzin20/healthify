import 'package:capstone_project/models/api/article_list_api.dart';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:flutter/material.dart';


class AllArticlesProvider with ChangeNotifier {
  ListArticles? _articles;
  bool _loading = true;

  ListArticles? get articles => _articles;
  bool get loading => _loading;

  Future<void> fetchArticles() async {
    try {
      _articles = await AllArticleListAPI.getArticles();
      _loading = false;
      notifyListeners();
    } catch (e) {
      // Handle error as needed
      print('Error fetching articles: $e');
    }
  }
}
