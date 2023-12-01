import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isButtonEnabled = false;

  void checkIfAllFields(String _) {
    setState(() {
      isButtonEnabled = oldpasswordController.text.isNotEmpty &&
          newpasswordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  void showChangePassSuccess(BuildContext context) {
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
                'Kata sandi anda berhasil diperbarui',
                style: ThemeTextStyle()
                    .labelLarge
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          // GANTI MENUJU PROFIL
          MaterialPageRoute(builder: (context) => const NewPassScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        title: Text(
          'Ganti Kata Sandi',
          style: TextStyle(
            color: ThemeColor().textChat,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(24),
        color: ThemeColor().textChat,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              title: 'Kata sandi Sekarang',
              hintText: '******',
              obscureText: true,
              controller: oldpasswordController,
              onChanged: checkIfAllFields,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'Kata sandi Baru',
              hintText: '******',
              obscureText: true,
              controller: newpasswordController,
              onChanged: checkIfAllFields,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'Konfirmasi Kata sandi',
              hintText: '******',
              obscureText: true,
              controller: confirmPasswordController,
              onChanged: checkIfAllFields,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                title: 'Simpan',
                onPressed: isButtonEnabled
                    ? () {
                        // show pop up
                        showChangePassSuccess(context);
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
