// ignore_for_file: use_build_context_synchronously

import 'package:capstone_project/models/api/otp_api.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  final RegisterProvider registerProvider;

  OtpProvider(this.registerProvider) {
    _setupTextControllers();
  }

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
    _addControllerListener(otp1Controller);
    _addControllerListener(otp2Controller);
    _addControllerListener(otp3Controller);
    _addControllerListener(otp4Controller);
  }

  void _addControllerListener(TextEditingController controller) {
    if (!controller.hasListeners) {
      controller.addListener(checkIfAllFieldsFilled);
    }
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

  void sendOTP() async {
    bool result = await OtpApi().createOTP(
      registerProvider.emailController.text,
    );
    if (result) {
      print("OTP sent successfully");
    } else {
      print("Failed to send OTP");
    }
  }

  void verifyAndRegister(BuildContext context) async {
    String enteredOtp = "${otp1Controller.text}"
        "${otp2Controller.text}"
        "${otp3Controller.text}"
        "${otp4Controller.text}";
    bool verificationResult = await OtpApi()
        .verifyOTP(registerProvider.emailController.text, enteredOtp);

    if (verificationResult) {
      String enteredOtp = "${otp1Controller.text}"
          "${otp2Controller.text}"
          "${otp3Controller.text}"
          "${otp4Controller.text}";
      bool registrationResult = OtpApi().registerUser(
          context, registerProvider.emailController.text, enteredOtp) as bool;

      if (registrationResult) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        const SnackBar(content: Text("Error"));
      }
    } else {
      const SnackBar(content: Text('Invalid OTP. Please try again.'));
    }
  }
}
