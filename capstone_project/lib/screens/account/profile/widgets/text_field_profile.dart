import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  final String hintText;
  final String? label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final int? maxLines;
  final FocusNode? focusNode;

  const TextFieldProfile({
    super.key,
    required this.hintText,
    this.label,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.maxLines,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        style: ThemeTextStyle().bodySmall,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          filled: true,
          fillColor: ThemeColor().textField,
          hintText: hintText,
          hintStyle: ThemeTextStyle().bodySmall.copyWith(
                color: ThemeColor().placeHolder,
              ),
          errorText: errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: ThemeColor().primaryButtonActive,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
        cursorColor: ThemeColor().primaryFrame,
        maxLines: maxLines,
        focusNode: focusNode,
      ),
    );
  }
}
