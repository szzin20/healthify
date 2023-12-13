import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
import 'package:capstone_project/screens/payment_detail/payment_detail_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:capstone_project/widgets/bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with SingleTickerProviderStateMixin {
  late int currentScreen;
  late TabController tabController;

  @override
  void initState() {
    currentScreen = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentScreen && mounted) {
          changeScreen(value);
        }
      },
    );
    super.initState();
  }

  void changeScreen(int newScreen) {
    setState(() {
      currentScreen = newScreen;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          currentScreen: currentScreen,
          tabController: tabController,
          selectedColor: ThemeColor().activeNavigationBar,
          unselectedColor: ThemeColor().disableNavigationBar,
          barColor: ThemeColor().bottomNavigationBar,
          start: 20,
          end: 2,
          child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [
              const HomeScreen(),
              const DoctorScreen(),
              Container(
                  color: Colors.orange,
                  child: const Center(child: Text('Riwayat'))),
              Container(
                  color: Colors.red,
                  child: const Center(child: Text('Artikel'))),
              const AccountScreen(),
            ],
          ),
        ),
      ),
    );
  }
}