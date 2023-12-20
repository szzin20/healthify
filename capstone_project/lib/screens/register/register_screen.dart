// ignore_for_file: use_build_context_synchronously

import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/google_button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final providerRegister =
        Provider.of<RegisterProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(24),
        color: ThemeColor().textChat,
        child: Consumer<RegisterProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
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
                    controller: providerRegister.emailController,
                    onChanged: (_) {
                      providerRegister.emailOnChange();
                      providerRegister.checkIfAllFieldsFilled();
                    },
                    errorText: providerRegister.messageErrorEmail,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Nama',
                    hintText: 'Nama',
                    controller: providerRegister.fullnameController,
                    onChanged: (_) {
                      providerRegister.nameOnChange();
                      providerRegister.checkIfAllFieldsFilled();
                    },
                    errorText: providerRegister.messageErrorName,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Password',
                    hintText: 'Buat Password',
                    obscureText: true,
                    controller: providerRegister.passwordController,
                    onChanged: (_) {
                      providerRegister.validatePassword();
                      providerRegister.checkIfAllFieldsFilled();
                    },
                    errorText: providerRegister.messageErrorPassword,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Konfirmasi Password',
                    hintText: 'Konfirmasi password',
                    obscureText: true,
                    controller: providerRegister.confirmPasswordController,
                    onChanged: (_) {
                      providerRegister.validateConfirmPassword(
                          providerRegister.passwordValue);
                      providerRegister.checkIfAllFieldsFilled();
                    },
                    errorText: providerRegister.messageErrorConfirmPass,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonWidget(
                      title: 'Daftar',
                      buttonColor: providerRegister.isButtonEnabled
                          ? ThemeColor().primaryButtonActive
                          : ThemeColor().primaryButton,
                      onPressed: (providerRegister.isButtonEnabled)
                          ? () {
                              providerRegister.registerUser(context);
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
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
            );
          },
        ),
      ),
    );
  }
}
