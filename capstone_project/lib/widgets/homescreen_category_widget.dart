import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenCategoryWidget extends StatelessWidget {
  final Widget iconWidget;
  final String text;
  const HomeScreenCategoryWidget({
    super.key,
    required this.iconWidget,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(
          8.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,

          const SizedBox(
            height: 8,
          ),
          Text(text, style: ThemeTextStyle().labelMedium),
        ],
      ),
    );
  }
}
