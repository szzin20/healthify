import 'package:capstone_project/models/api/login_process_api.dart';
import 'package:capstone_project/models/login_data_model.dart';
import 'package:flutter/material.dart';

class LoginProcessProvider extends ChangeNotifier {
  LoginData? _dataLogin;

  LoginData? get login => _dataLogin;

  Future<void> sendLoginData(String email, String pass) async {
    try {
      final loginData = await GetLoginData.postLogin(email, pass);
      _dataLogin = loginData;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
