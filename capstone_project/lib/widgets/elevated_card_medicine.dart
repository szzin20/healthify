import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final String type;

  const ElevatedCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 174,
          width: 154,
          child: Card(
            color: ThemeColor().white,
            shadowColor: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        image,
                        height: 88,
                        width: 138,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 88,
                            width: 138,
                            color: ThemeColor().disableNavigationBar,
                            child: Center(
                              child: Text(
                                'No Image',
                                style: ThemeTextStyle().labelMedium,
                              ),
                            ),
                          );
                        },
                      ),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
