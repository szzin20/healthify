import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/homescreen_category_widget.dart';
import 'package:capstone_project/widgets/not_active_homescreen_category_widget.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeScreenCategoryWidget(
                iconWidget: Image.asset(
                  'assets/icons/all_icon/dokter.png',
                  height: 24,
                  width: 24,
                ),
                text: 'Konsultasi',
              ),
              HomeScreenCategoryWidget(
                iconWidget:  Image.asset(
                  'assets/icons/all_icon/mdi_drugs.png',
                  height: 24,
                  width: 24,
                ),
                text: 'Obat',
              ),
              NotActiveHomeScreenCategoryWidget(
                iconWidget:  Image.asset(
                  'assets/icons/all_icon/Ambulance.png',
                  height: 24,
                  width: 24,
                ),
                text: 'Ambulan',
              ),
              NotActiveHomeScreenCategoryWidget(
                iconWidget:  Image.asset(
                  'assets/icons/all_icon/syringe.png',
                  height: 24,
                  width: 24,
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
