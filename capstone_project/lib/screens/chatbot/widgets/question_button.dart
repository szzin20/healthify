import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const QuestionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 12),
      height: MediaQuery.of(context).size.height * .052,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: MaterialButton(
        color: Colors.white,
        elevation: 3,
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        onPressed: onPressed,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(
              text,
              style: ThemeTextStyle()
                  .bodyLarge
                  .copyWith(color: ThemeColor().textChatBot),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
