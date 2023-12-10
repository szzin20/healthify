import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class OtpProvider extends ChangeNotifier {
  final Dio _dio = Dio();

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

  Future<void> sendOtp(String email) async {
    try {
      // Make an API call to send OTP
      Response response = await _dio.post(
        'https://www.healthify.my.id/users/get-otp',
        data: {'email': email},
      );

      // Handle the response as needed
      print('Send OTP Response: ${response.data}');
    } catch (error) {
      // Handle error
      print('Error sending OTP: $error');
    }
  }

  Future<bool> verifyOtp(String email, int otp) async {
    try {
      // Make an API call to verify OTP
      Response response = await _dio.post(
        'https://www.healthify.my.id/users/verify-otp',
        data: {'email': email, 'otp': otp},
      );

      // Handle the response as needed
      print('Verify OTP Response: ${response.data}');

      // Return true if the OTP is valid, false otherwise
      return response.data['success'] ?? false;
    } catch (error) {
      // Handle error
      print('Error verifying OTP: $error');
      return false;
    }
  }
}
