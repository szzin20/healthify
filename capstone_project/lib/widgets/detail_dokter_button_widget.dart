import 'package:capstone_project/constants/color_theme.dart';
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: const EdgeInsets.all(0), // Remove padding
  ).copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        return ThemeColor().primaryButtonActive;
      },
    ),
  ),
  onPressed: onPressed,
  child: Container(
    width: double.infinity, // Make the container take the entire width
    height: 42.0, // Set the desired height
    alignment: Alignment.center,
    child: Text(
      title,
      style: ThemeTextStyle().titleMedium.copyWith(color: Colors.white),
    ),
  ),
);

  }
}
