import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardButtonWidget extends StatelessWidget {
  final String label;
  final String svgIconAsset;
  final void Function() onPressed;

  const CardButtonWidget({
    super.key,
    required this.label,
    required this.svgIconAsset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: 60,
      color: ThemeColor().primaryFrame,
      textColor: ThemeColor().white,
      child: Column(
        children: [
          SvgPicture.asset(svgIconAsset),
          Text(
            label,
            style: ThemeTextStyle().labelLargeBold,
          ),
        ],
      ),
    );
  }
}
