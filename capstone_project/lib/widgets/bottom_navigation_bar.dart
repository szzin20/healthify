import 'package:capstone_project/constants/color_theme.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(Icons.remove_red_eye),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Data',
          ),
        ],
      ),
    );
  }
}
