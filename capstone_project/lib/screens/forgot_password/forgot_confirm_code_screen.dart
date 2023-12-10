import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/forgot_password/reset_pass_screen.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';

class ForgotConfirmationCodeScreen extends StatefulWidget {
  const ForgotConfirmationCodeScreen({super.key});

  @override
  State<ForgotConfirmationCodeScreen> createState() =>
      _ForgotConfirmationCodeScreenState();
}

class _ForgotConfirmationCodeScreenState
    extends State<ForgotConfirmationCodeScreen> {
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to each controller
    code1.addListener(updateButtonState);
    code2.addListener(updateButtonState);
    code3.addListener(updateButtonState);
    code4.addListener(updateButtonState);
  }

  void updateButtonState() {
    // Check if all fields are filled
    bool allFieldsFilled = code1.text.isNotEmpty &&
        code2.text.isNotEmpty &&
        code3.text.isNotEmpty &&
        code4.text.isNotEmpty;

    setState(() {
      isButtonEnabled = allFieldsFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi Email',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ThemeColor().textChangeProfil,
              ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
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
              'Dapatkan Kode',
              style: ThemeTextStyle()
                  .titleLarge
                  .copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'silakan masukkan 4 digit kode yang dikirimkan ke email Anda',
              style: ThemeTextStyle()
                  .titleMedium
                  .copyWith(color: ThemeColor().filter),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // PIN INPUT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputBoxWidget(
                  controller: code1,
                ),
                InputBoxWidget(
                  controller: code2,
                ),
                InputBoxWidget(
                  controller: code3,
                ),
                InputBoxWidget(
                  controller: code4,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'jika Anda belum menerima kode  ',
                  style: ThemeTextStyle()
                      .titleSmall
                      .copyWith(color: ThemeColor().filter),
                ),
                GestureDetector(
                  onTap: () {
                    // mengirim email kembali
                  },
                  child: Text(
                    'Resend',
                    style: ThemeTextStyle().titleSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ThemeColor().primaryLabel),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Verifikasi dan Lanjutkan',
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()),
                        );
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
