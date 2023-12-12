import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
  TextEditingController input4 = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to each controller
    input1.addListener(updateButtonState);
    input2.addListener(updateButtonState);
    input3.addListener(updateButtonState);
    input4.addListener(updateButtonState);
  }

  void updateButtonState() {
    // Check if all fields are filled
    bool allFieldsFilled = input1.text.isNotEmpty &&
        input2.text.isNotEmpty &&
        input3.text.isNotEmpty &&
        input4.text.isNotEmpty;

    setState(() {
      isButtonEnabled = allFieldsFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konfirmasi Kode',
          style: ThemeTextStyle()
              .titleMedium
              .copyWith(fontSize: 20, color: const Color(0xffFBFBFB)),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
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
                  controller: input1,
                ),
                InputBoxWidget(
                  controller: input2,
                ),
                InputBoxWidget(
                  controller: input3,
                ),
                InputBoxWidget(
                  controller: input4,
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
                title: 'Verifikasi dan lanjutkan',
                onPressed: isButtonEnabled
                    ? () {
                        // menuju halaman home
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
