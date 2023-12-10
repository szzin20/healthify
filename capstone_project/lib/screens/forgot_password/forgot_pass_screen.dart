import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/forgot_password/forgot_confirm_code_screen.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  void checkFieldsFilled(String _) {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  void showAlertSuccess(BuildContext context) {
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
                'Silahkan cek Email Anda!',
                style: ThemeTextStyle()
                    .labelLarge
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Kami telah mengirimkan kode verifikasi ke alamat email yang Anda cantumkan.',
                style: ThemeTextStyle().labelMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ForgotConfirmationCodeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Sandi',
          style: ThemeTextStyle().labelLarge2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ThemeColor().textChangeProfil,
              ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: ThemeColor().textChat,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Masukkan Email disini',
              style: ThemeTextStyle()
                  .titleLarge
                  .copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'masukkan alamat email yang terkait dengan akun Anda',
              style: ThemeTextStyle()
                  .titleMedium
                  .copyWith(color: ThemeColor().filter),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              title: 'Email',
              hintText: 'masukkan email disini',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: checkFieldsFilled,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Lanjutkan',
                onPressed: isButtonEnabled
                    ? () {
                        // show pop up
                        showAlertSuccess(context);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
