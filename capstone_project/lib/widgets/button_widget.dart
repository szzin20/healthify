<<<<<<< HEAD
import 'package:capstone_project/constants/color_theme.dart';
=======
>>>>>>> feat/login
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ButtonWidget({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
<<<<<<< HEAD
        backgroundColor: ThemeColor().primaryButtonActive,
=======
        backgroundColor: const Color(0xff008772),
>>>>>>> feat/login
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: const Size.fromHeight(42.0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
<<<<<<< HEAD
        style: ThemeTextStyle().titleMedium.copyWith(color: Colors.white),
=======
        style: ThemeTextStyle().labelLarge.copyWith(color: Colors.white),
>>>>>>> feat/login
      ),
    );
  }
}
