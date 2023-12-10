import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/homescreen_category_widget.dart';
import 'package:capstone_project/widgets/not_active_homescreen_category_widget.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apa yang kamu butuhkan?',
            style: ThemeTextStyle().titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeScreenCategoryWidget(
                iconWidget: Icon(
                  Icons.abc,
                ),
                text: 'Konsultasi',
              ),
              HomeScreenCategoryWidget(
                iconWidget: Icon(
                  Icons.abc,
                ),
                text: 'Obat',
              ),
              NotActiveHomeScreenCategoryWidget(
                iconWidget: Icon(
                  Icons.abc,
                ),
                text: 'Ambulan',
              ),
              NotActiveHomeScreenCategoryWidget(
                iconWidget: Icon(
                  Icons.abc,
                ),
                text: 'Vaksinasi',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
