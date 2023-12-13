import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class MenuArtikel extends StatefulWidget {
  const MenuArtikel({super.key});

  @override
  State<MenuArtikel> createState() => _MenuArtikelState();
}

class _MenuArtikelState extends State<MenuArtikel> {
  final List<String> artikelItems = [
    'Terbaru',
    'Kulit & Kelamin',
    'Nutrisi',
    'Gigi & Mulut',
    'Psikiatri',
    'Kardiologi'
  ];
  int selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8,
        children: List.generate(
          artikelItems.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedMenuIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedMenuIndex == index
                        ? Colors.transparent
                        : const Color(0xffe3e3e3),
                    width: 1.0,
                  ),
                  color: selectedMenuIndex == index
                      ? ThemeColor().primaryButtonActive
                      : Colors.transparent,
                ),
                child: Text(
                  artikelItems[index],
                  textAlign: TextAlign.center,
                  style: ThemeTextStyle().labelMedium.copyWith(
                        color: selectedMenuIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
