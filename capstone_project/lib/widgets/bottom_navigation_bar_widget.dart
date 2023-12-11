import 'package:capstone_project/constants/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ThemeColor().bottomNavigationBar,
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedFontSize: 12,
        selectedItemColor: ThemeColor().kirimButton,
        unselectedItemColor: ThemeColor().primaryButton,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.stethoscope),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Data',
          ),
        ],
      ),
    );
  }
}
