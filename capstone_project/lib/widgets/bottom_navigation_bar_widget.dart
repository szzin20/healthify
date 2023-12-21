import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/artikel/artikel.dart';
import 'package:capstone_project/screens/history_list_screen/history_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavigationBarWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const DoctorScreen(),
      const HistoryScreen(),
      const ArtikelScreen(),
      const AccountScreen(),
    ];
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
        currentIndex: currentIndex,
        onTap: (value) {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pages[value],
            ),
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.stethoscope),
            label: 'Dokter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Artikel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
