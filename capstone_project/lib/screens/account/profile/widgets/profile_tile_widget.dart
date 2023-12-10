import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ProfileTileWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget content;

  const ProfileTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 16,
        leading: icon,
        title: Text(
          title,
          style: ThemeTextStyle().titleMedium,
        ),
        trailing: SizedBox(
          width: 180,
          child: content,
        ),
      ),
    );
  }
}
