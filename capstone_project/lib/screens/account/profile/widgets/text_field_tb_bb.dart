import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class TextFieldTbBb extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  const TextFieldTbBb({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1 / 4,
      height: MediaQuery.of(context).size.height * 1 / 17,
      child: TextFormField(
        controller: controller,
        style: ThemeTextStyle().labelMedium,
        cursorColor: ThemeColor().primaryFrame,
        keyboardType: TextInputType.number,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: ThemeTextStyle().labelMedium,
          floatingLabelStyle: ThemeTextStyle().labelMedium.copyWith(
                color: ThemeColor().primaryFrame,
              ),
          suffixIcon: Text(
            title,
            style: ThemeTextStyle().labelMedium,
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 35,
            maxWidth: 35,
            minHeight: 0,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
