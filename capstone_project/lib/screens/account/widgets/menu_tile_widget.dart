import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class MenuTileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function()? onTap;

  const MenuTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: ThemeTextStyle().titleMedium,
        ),
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        horizontalTitleGap: 24,
      ),
    );
  }
}
