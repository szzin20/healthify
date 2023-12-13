import 'package:flutter/material.dart';

class CheckLoginProvider extends ChangeNotifier {
  String user = '';
  String pass = '';

  String get username => user;
  String get password => pass;

  fetchUsername(String userText) {
    user = userText;
    notifyListeners();
  }
  fetchPassword(String passText) {
    pass = passText;
    notifyListeners();
  }
}