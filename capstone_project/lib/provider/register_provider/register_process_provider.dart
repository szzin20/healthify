import 'package:capstone_project/models/api/register_api.dart';
import 'package:capstone_project/models/register_model.dart';
import 'package:flutter/material.dart';

class RegisterProcessProvider extends ChangeNotifier {
  RegisterData? _dataRegister;
  RegisterData? get dataRegister => _dataRegister;

  Future<void> sendRegisterData(String fullname, String email, String password) async {
    try {
      final registerData = await GetRegisterData.postRegister(fullname, email, password);
      _dataRegister = registerData;
      notifyListeners();
    } catch (e) {
      rethrow;
    }   
  }
}
