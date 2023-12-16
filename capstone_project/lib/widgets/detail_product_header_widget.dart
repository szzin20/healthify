import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailProductHeaderWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String type;
  const DetailProductHeaderWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 146,
          width: 112,
          child: Image(
            image: NetworkImage(
              image,
            ),
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Center(
                child: Text('No Image'),
              );
            },
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ThemeTextStyle().titleMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                price,
                style: ThemeTextStyle().titleSmall,
              ),
              Text(
                'Per $type',
                style: ThemeTextStyle().bodyMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      size: 20,
                      color: ThemeColor().primaryFrame,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Bagikan Tautan',
                      style: ThemeTextStyle().bodySmallShare,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
