import 'package:capstone_project/models/api/article_by_id_api.dart';
import 'package:capstone_project/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticleByIdProvider with ChangeNotifier {
  Article? _articles;
  bool _loading = true;

  Article? get articles => _articles;
  bool get loading => _loading;

  Future<void> fetchArticles(int id) async {
    try {
      _articles = await ArticleIdAPI.getArticles(id);
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}