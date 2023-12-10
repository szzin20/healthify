import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final String type;

  const ElevatedCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: ThemeColor().white,
          shadowColor: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Image.network(
                    image,
                    height: 150,
                    width: 200,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      name,
                      style: ThemeTextStyle().labelMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Rp $price / $type",
                      style: ThemeTextStyle().labelMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
