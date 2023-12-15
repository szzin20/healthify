import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: ThemeTextStyle().titleMedium.copyWith(
                color: ThemeColor().white,
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
        foregroundColor: ThemeColor().white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'data',
              style: ThemeTextStyle().titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Text(
                    'data',
                    style: ThemeTextStyle().titleSmallWhite,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Text(
                    'data',
                    style: ThemeTextStyle().titleSmallWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
