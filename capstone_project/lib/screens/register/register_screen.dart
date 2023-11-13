import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/register/confirmation_code_screen.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/google_button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void checkIfAllFieldsFilled(String _) {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
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
        MaterialPageRoute(builder: (context) => const ConfirmationCodeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(24),
        color: ThemeColor().textChat,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Daftar',
              style: ThemeTextStyle().displaySmall,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              title: 'Email',
              hintText: 'email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: checkIfAllFieldsFilled,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Nama',
              hintText: 'Nama',
              controller: nameController,
              onChanged: checkIfAllFieldsFilled,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Daftar',
                onPressed: isButtonEnabled
                    ? () {
                        // show pop up
                        showRegistrationSuccess(context);
                      }
                    : null,
              ),
            ),
            const SizedBox(height: 34),
            const Text(
              'Atau daftar menggunakan',
              style: TextStyle(
                color: Color(0xff999999),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 22),
            GoogleButtonWidget(onPressed: () {
              // menuju google
            }),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: ThemeTextStyle().bodyLarge,
                ),
                GestureDetector(
                  onTap: () {
                    // menuju halaman login
                  },
                  child: Text(
                    'Login disini',
                    style: ThemeTextStyle().bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
