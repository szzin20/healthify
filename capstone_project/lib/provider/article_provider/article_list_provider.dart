import 'package:capstone_project/models/api/article_list_limit_api.dart';
import 'package:capstone_project/models/article_list_model.dart';
import 'package:flutter/material.dart';


class ArticlesListProvider with ChangeNotifier {
  ListArticles? _articles;
  bool _loading = true;

  ListArticles? get articles => _articles;
  bool get loading => _loading;

  Future<void> fetchArticles() async {
    try {
      _articles = await ArticleListAPI.getArticles();
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
