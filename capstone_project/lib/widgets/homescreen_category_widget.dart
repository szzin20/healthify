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
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4),
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
          SizedBox(
            height: 4,
          ),
          Text(text),
        ],
      ),
    );
  }
}
