import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/register_provider/otp_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputBoxWidget extends StatefulWidget {
  final TextEditingController? controller;
  const InputBoxWidget({super.key, this.controller});

  @override
  State<InputBoxWidget> createState() => _InputBoxWidgetState();
}

class _InputBoxWidgetState extends State<InputBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<OtpProvider>(context);
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffE3E3E3),
      ),
      child: TextField(
        maxLength: 1,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style:
            ThemeTextStyle().hadlineSmall.copyWith(fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
          inputProvider.checkIfAllFieldsFilled();
        },
        decoration:
            const InputDecoration(counterText: '', border: InputBorder.none),
      ),
    );
  }
}
