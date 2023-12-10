import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController get _otp1Controller => otp1Controller;
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController get _otp2Controller => otp2Controller;
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController get _otp3Controller => otp3Controller;
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController get _otp4Controller => otp4Controller;

  bool isButtonEnabled = false;

  OTPProvider() {
    _setupTextControllers();
  }

  void _setupTextControllers() {
    otp1Controller.addListener(checkIfAllFieldsFilled);
    otp2Controller.addListener(checkIfAllFieldsFilled);
    otp3Controller.addListener(checkIfAllFieldsFilled);
    otp4Controller.addListener(checkIfAllFieldsFilled);
  }

  void checkIfAllFieldsFilled() {
    isButtonEnabled = otp1Controller.text.isNotEmpty &&
        otp2Controller.text.isNotEmpty &&
        otp3Controller.text.isNotEmpty &&
        otp4Controller.text.isNotEmpty;
    notifyListeners();
  }

  void disposeControllers() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
  }

  EmailOTP myauth = EmailOTP();

  /// Sends an OTP and returns a boolean indicating success.
  Future<bool> sendOTP() async {
    return await myauth.sendOTP();
  }

  /// Verifies the entered OTP and returns a boolean indicating success.
  Future<bool> verifyOTP() async {
    final enteredOTP = (otp1Controller.text +
            otp2Controller.text +
            otp3Controller.text +
            otp4Controller.text)
        .trim();

    return await myauth.verifyOTP(otp: enteredOTP);
  }

  Future<bool> resendOTP() async {
    try {
      // Implement your logic for resending OTP here
      // For example, you can use the same method used for sending OTP
      final resendResult = await myauth.sendOTP();
      return resendResult; // Return the result of resending OTP
    } catch (e) {
      // Handle errors if needed
      print('Error during OTP resend: $e');
      return false; // Return false if resending fails
    }
  }
}
