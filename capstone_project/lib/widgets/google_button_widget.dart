import 'package:capstone_project/constants/color_theme.dart';
import 'package:flutter/material.dart';

class GoogleButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
<<<<<<< HEAD
  
  const GoogleButtonWidget({
    super.key, 
=======

  const GoogleButtonWidget({
    super.key,
>>>>>>> feat/login
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 118,
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
<<<<<<< HEAD
            side: BorderSide(
              width: 2,
              color: ThemeColor().primaryButtonActive
            ),
=======
            side: BorderSide(width: 2, color: ThemeColor().primaryButtonActive),
>>>>>>> feat/login
          ),
        ),
        child: Image.asset(
          'assets/images/Google.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> feat/login
