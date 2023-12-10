// ignore_for_file: use_build_context_synchronously

import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/api/register_api.dart';
import 'package:capstone_project/models/register_model.dart';
import 'package:flutter/material.dart';
import '../../screens/register/confirmation_code_screen.dart';

class RegisterProvider extends ChangeNotifier {

  // EMAIL VALIDATION
  String _emailValue = "";
  String get emailValue => _emailValue;
  TextEditingController emailController = TextEditingController();
  TextEditingController get _emailController => emailController;
  String? messageErrorEmail;
  String? get _messageErrorEmail => messageErrorEmail;

  void emailOnChange() {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      messageErrorEmail = "Email Harus Diisi";
    } else if (!_isEmailValid(email)) {
      messageErrorEmail = "Format email tidak falid";
    } else {
      messageErrorEmail = null;
    }
  }

  bool _isEmailValid(String email) {
    // Regular expression for a simple email validation
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // NAME VALIDATION
  String _nameValue = "";
  String get nameValue => _nameValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController get _nameController => nameController;
  String? messageErrorName;
  String? get _messageErrorName => messageErrorName;

  void nameOnChange() {
    String name = _nameController.text.trim();
    if (name.isEmpty) {
      messageErrorName = "Nama harus diisi";
    } else if (name.length < 2) {
      messageErrorName = "Nama harus lebih dari 2 kata";
    } else if (!_isValidName(name)) {
      messageErrorName =
          "Nama tidak boleh mengandung angka atau karakter khusus";
    } else {
      messageErrorName = null;
    }
    notifyListeners();
  }

  bool _isValidName(String name) {
    // Use a regular expression to check if the name contains only letters and spaces
    final RegExp nameRegExp = RegExp(r"^[A-Za-z\s]+$");
    return nameRegExp.hasMatch(name);
  }

  // PASSWORD VALIDATION
  String _passwordValue = "";
  String get passwordValue => _passwordValue;
  TextEditingController passwordController = TextEditingController();
  TextEditingController get _passwordController => passwordController;
  String? messageErrorPassword;
  String? get _messageErrorPassword => messageErrorPassword;

  void validatePassword() {
    _passwordValue =
        _passwordController.text.trim(); // Set the original password
    String password = _passwordValue;

    if (password.isEmpty) {
      messageErrorPassword = "Password harus diisi";
    } else if (!_isPasswordValid(password)) {
      messageErrorPassword =
          "Password harus lebih dari 9 karakter, terdiri dari angka dan karakter";
    } else {
      messageErrorPassword = null;
    }
  }

  bool _isPasswordValid(String password) {
    // Password should be at least 8 characters long and contain at least one digit and one special character
    final passwordRegExp = RegExp(
      r'^(?=.*[0-9])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).{9,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  // CONFIRM PASSWORD VALIDATION
  String _confirmPassValue = "";
  String get confirmPassValue => _confirmPassValue;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController get _confirmPasswordController =>
      confirmPasswordController;
  String? messageErrorConfirmPass;
  String? get _messageErrorConfirmPass => _messageErrorConfirmPass;

  void validateConfirmPassword(String originalPassword) {
    String confirmPassword = _confirmPasswordController.text.trim();

    if (confirmPassword.isEmpty) {
      messageErrorConfirmPass = "Konfirmasi password harus diisi";
    } else if (confirmPassword != originalPassword) {
      messageErrorConfirmPass = "Passwords tidak sesuai";
    } else {
      messageErrorConfirmPass = null;
    }
  }

  bool isButtonEnabled = false;

  RegisterProvider() {
    _setupTextControllers();
  }

  void _setupTextControllers() {
    emailController.addListener(checkIfAllFieldsFilled);
    nameController.addListener(checkIfAllFieldsFilled);
    passwordController.addListener(checkIfAllFieldsFilled);
    confirmPasswordController.addListener(checkIfAllFieldsFilled);
  }

  void checkIfAllFieldsFilled() {
    isButtonEnabled = emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
    notifyListeners();
  }

  void clearFields() {
    _emailValue = "";
    _nameValue = "";
    _passwordValue = "";
    _confirmPassValue = "";
    notifyListeners();
  }

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  Future<void> postData(BuildContext context) async {
    try {
      final postResponse = await RegisterApi().postData(
        dataRegister: RegisterModel(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
        ).toJson(),
      );

      if (postResponse.statusCode == 201) {
        // Registration successful, send OTP
        _emailValue = emailController.text;
        showRegistrationSuccess(context);
      } else if (postResponse.statusCode == 409) {
        // Email is already registered, show appropriate error message
        showRegistrationError(context, 'Email Anda Telah Terdaftar');
      } else {
        // Handle other response codes or scenarios if needed
        print('Unexpected response code: ${postResponse.statusCode}');
      }
    } catch (e) {
      print('Error during registration: $e');
      // Handle other errors if needed
    }
    notifyListeners();
  }

  void showRegistrationError(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 60,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Registrasi Anda Gagal!',
                style: ThemeTextStyle()
                    .labelLarge
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.red),
              ),
              Text(
                errorMessage,
                style: ThemeTextStyle().labelMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }

  void showRegistrationSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/check_circle.png',
                width: 60,
                height: 60,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Terima kasih atas pendaftaran Anda!',
                style: ThemeTextStyle()
                    .labelLarge
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Kami telah mengirimkan kode verifikasi ke alamat email yang Anda daftarkan.',
                style: ThemeTextStyle().labelMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConfirmationCodeScreen(),
        ),
      );
    });
  }
}
