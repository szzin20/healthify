import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const OutlineButtonWidget({
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
        fixedSize: const Size.fromHeight(42.0),
        side: BorderSide(color: ThemeColor().primaryFrame, width: 2),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: ThemeTextStyle().titleMedium.copyWith(
                  color: ThemeColor().primaryFrame,
                ),
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 20,
            color: ThemeColor().primaryFrame,
          ),
        ],
      ),
    );
  }
}
