// ignore_for_file: use_build_context_synchronously, unused_element, recursive_getters, unrelated_type_equality_checks

import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/register_provider/register_process_provider.dart';
import 'package:capstone_project/screens/register/confirmation_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    _setupTextControllers();
  }

  RegisterProvider.initialize() {
    _setupTextControllers();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    emailController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // EMAIL VALIDATION
  String _emailValue = "";
  String get emailValue => _emailValue;
  TextEditingController emailController = TextEditingController();
  TextEditingController get _emailController => emailController;
  String? messageErrorEmail;
  String? get _messageErrorEmail => messageErrorEmail;

  void emailOnChange() {
    _emailValue = _emailController.text.trim();

    if (_emailValue.isEmpty) {
      messageErrorEmail = "Email Harus Diisi";
    } else if (!_isEmailValid(_emailValue)) {
      messageErrorEmail = "Format email tidak falid";
    } else {
      messageErrorEmail = null;
    }
    notifyListeners();
  }

  bool _isEmailValid(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // NAME VALIDATION
  String _fullnameValue = "";
  String get fullnameValue => _fullnameValue;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController get _fullnameController => fullnameController;
  String? messageErrorName;
  String? get _messageErrorName => messageErrorName;

  void nameOnChange() {
    String name = _fullnameController.text.trim();
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
      messageErrorPassword = "Password harus lebih dari 9 karakter";
    } else {
      messageErrorPassword = null;
    }
  }

  bool _isPasswordValid(String password) {
    // Password should be at least 8 characters long and contain at least one digit and one special character
    final passwordRegExp = RegExp(
      r'^(?=.*[0-9])[0-9a-zA-Z]{10,}$',
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

  void _setupTextControllers() {
    emailController.addListener(checkIfAllFieldsFilled);
    fullnameController.addListener(checkIfAllFieldsFilled);
    passwordController.addListener(checkIfAllFieldsFilled);
    confirmPasswordController.addListener(checkIfAllFieldsFilled);
  }

  void checkIfAllFieldsFilled() {
    final fieldsFilled = [
      emailController.text.isNotEmpty,
      fullnameController.text.isNotEmpty,
      passwordController.text.isNotEmpty,
      confirmPasswordController.text.isNotEmpty,
    ];

    final errorMessages = [
      messageErrorEmail?.isEmpty,
      messageErrorName?.isEmpty,
      messageErrorPassword?.isEmpty,
      messageErrorConfirmPass?.isEmpty,
    ];

    isButtonEnabled = fieldsFilled.every((field) => field) &&
        errorMessages.every((message) => message == null);
    notifyListeners();
  }

  void clearFields() {
    _emailValue = "";
    _fullnameValue = "";
    _passwordValue = "";
    _confirmPassValue = "";
    notifyListeners();
  }

  void registerUser(BuildContext context) async {
    try {
      checkIfAllFieldsFilled();

      // Continue with registration process
      final processRegisterProvider =
          Provider.of<RegisterProcessProvider>(context, listen: false);

      await processRegisterProvider.sendRegisterData(
        fullnameController.text,
        emailController.text,
        passwordController.text,
      );

      final regisResult = processRegisterProvider.dataRegister;

      if (regisResult != null) {

        if (regisResult.meta?.success == false) {
          showRegistrationError(
            context,
            'Email Anda Telah Terdaftar',
          );
        } else if (regisResult.meta?.success == true) {
          _emailValue = emailController.text;
          showRegistrationSuccess(context);
        }
      }
    } catch (e) {
      rethrow;
    }

    notifyListeners(); // Notify listeners after updating state
  }
}

// POP UP ERROR

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

// POP UP SUCCESS

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
