import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void checkIfAllFieldsFilled(String _) {
    setState(() {
      isButtonEnabled = passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  void showChangeSuccess(BuildContext context) {
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
                'Kata sandi telah berhasil diperbarui!',
                style: ThemeTextStyle()
                    .labelLarge
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atur Ulang Kata Sandi',
          style: ThemeTextStyle().titleMedium.copyWith(
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
              'Masukkan Password Baru',
              style: ThemeTextStyle()
                  .titleLarge
                  .copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'kata sandi baru Anda harus berbeda dengan kata sandi yang digunakan sebelumnya',
              style: ThemeTextStyle()
                  .titleMedium
                  .copyWith(color: ThemeColor().filter),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              title: 'Passsword',
              hintText: 'Buat Password',
              obscureText: true,
              controller: passwordController,
              onChanged: checkIfAllFieldsFilled,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Konfirmasi Password',
              hintText: 'Konfirmasi password',
              obscureText: true,
              controller: confirmPasswordController,
              onChanged: checkIfAllFieldsFilled,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Pulihkan Password',
                onPressed: isButtonEnabled
                    ? () {
                        // show pop up
                        showChangeSuccess(context);
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