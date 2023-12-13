import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/menu_doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDoctor extends StatelessWidget {
   final int selectedMenuIndex;
  final Function(int) onMenuChanged;
  final List<String> doctorItems;

  MenuDoctor({
    required this.selectedMenuIndex,
    required this.onMenuChanged,
    required this.doctorItems,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      child: Consumer<MenuProvider>(
        builder: (context, menuProvider, _) {
          return Wrap(
            spacing: 8,
            children: List.generate(
              doctorItems.length,
              (index) => GestureDetector(
                onTap: () {
                  menuProvider.setMenuIndex(index);
                  onMenuChanged(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: menuProvider.selectedMenuIndex == index
                            ? Colors.transparent
                            : const Color(0xffe3e3e3),
                        width: 1.0,
                      ),
                      color: menuProvider.selectedMenuIndex == index
                          ? ThemeColor().primaryButtonActive
                          : Colors.transparent,
                    ),
                    child: Text(
                      doctorItems[index],
                      textAlign: TextAlign.center,
                      style: ThemeTextStyle().labelMedium.copyWith(
                        color: menuProvider.selectedMenuIndex == index
                          ? Colors.white
                          : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
