import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ContactUsProvider extends ChangeNotifier {
  bool _isEnable = false;
  get isEnable => _isEnable;

  String? _errorTextNama;
  get errorTextNama => _errorTextNama;
  String? _errorTextEmail;
  get errorTextEmail => _errorTextEmail;

  String _namaValue = "";
  get namaValue => _namaValue;
  String _emailValue = "";
  get emailValue => _emailValue;
  final String _pesanValue = "";
  get pesanValue => _pesanValue;

  final _namaController = TextEditingController();
  get namaController => _namaController;
  final _emailController = TextEditingController();
  get emailController => _emailController;
  final _pesanController = TextEditingController();
  get pesanController => _pesanController;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _pesanController.dispose();
    super.dispose();
  }

  void namaOnChanged(String value) {
    _namaValue = value;
    if (_namaValue.isEmpty == true) {
      _errorTextNama = null;
      _isEnable = false;
    } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(_namaValue)) {
      _errorTextNama = 'Woops! No special characters or numbers..';
      _isEnable = false;
    } else {
      _errorTextNama = null;
      _isEnable = true;
    }
    notifyListeners();
  }

  void emailOnChanged(String value) {
    _emailValue = value;
    if (_emailValue.isEmpty == true) {
      _errorTextEmail = null;
      _isEnable = false;
    } else if (EmailValidator.validate(_emailValue) == false) {
      _errorTextEmail = "Please enter a valid email";
      _isEnable = false;
    } else {
      _errorTextEmail = null;
      _isEnable = true;
    }
    notifyListeners();
  }

  void pesanOnChanged(String value) {
    _emailValue = value;
    notifyListeners();
  }

  void Function()? kirimButtonValidation() {
    if (_namaController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _pesanController.text.isNotEmpty &&
        _isEnable == true) {
      return () {
        _namaController.clear();
        _emailController.clear();
        _pesanController.clear();
      };
    }
    return null;
  }
}
