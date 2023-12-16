import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailArticleHeaderWidget extends StatelessWidget {
  final String title;
  final String name;
  const DetailArticleHeaderWidget({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ThemeTextStyle().titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                'Kesehatan',
                style: ThemeTextStyle().titleSmallWhite,
              ),
            ),
            const SizedBox(
              width: 8,
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
                'Artikel',
                style: ThemeTextStyle().titleSmallWhite,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '5 menit',
              style: ThemeTextStyle().labelSmall,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: ThemeTextStyle().labelSmallGrey,
            children: <TextSpan>[
              const TextSpan(
                text: 'Ditinjau oleh ',
              ),
              TextSpan(
                text: name,
                style: ThemeTextStyle().labelSmall,
              ),
              const TextSpan(
                text: '10 November 2023',
              ),
            ],
          ),
        )
      ],
    );
  }
}
