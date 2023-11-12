import 'package:flutter/material.dart';

class googleButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  
  const googleButtonWidget({
    super.key, 
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
            side: const BorderSide(
              width: 2,
              color: Color(0xFF008772),
            ),
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
}