import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/regiter_provider/otp_provider.dart';
import 'package:capstone_project/provider/regiter_provider/register_provider.dart';
import 'package:capstone_project/screens/home.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final providerOTP = Provider.of<OTPProvider>(context, listen: true);
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
        child: Consumer<OTPProvider>(
          builder: (context, value, child) {
            return Column(
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
                      controller: providerOTP.otp1Controller,
                    ),
                    InputBoxWidget(
                      controller: providerOTP.otp2Controller,
                    ),
                    InputBoxWidget(
                      controller: providerOTP.otp3Controller,
                    ),
                    InputBoxWidget(
                      controller: providerOTP.otp4Controller,
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
                      onTap: () async {
                        await Provider.of<RegisterProvider>(context, listen: false).resendOTP(context);
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
                    onPressed: providerOTP.isButtonEnabled
                        ? () async {
                            providerOTP.checkIfAllFieldsFilled();
                            if (await providerOTP.verifyOTP()) {
                              // OTP is verified, navigate to the home screen
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } else {
                              // Handle OTP verification failure if needed
                            }
                          }
                        : null,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
