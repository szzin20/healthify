import 'package:flutter/material.dart';

class ButtonNewWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color buttonColor;

  const ButtonNewWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonColor = const Color(0XFF008772), 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fixedSize: const Size.fromHeight(42.0),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return buttonColor; 
          },
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
