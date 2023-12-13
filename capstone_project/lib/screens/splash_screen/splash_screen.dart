import 'dart:async';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backgroundTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _backgroundTween = ColorTween(
      begin: ThemeColor().primaryFrame,
      end: ThemeColor().textChat,
    ).animate(_animationController);

    _animationController.forward();
    if (SharedPreferencesUtils.isLoggedIn()) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      );
    } else {
            Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundTween,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _backgroundTween.value,
          body: Center(
            child: _backgroundTween.isCompleted
                ? Image.asset(
                    'assets/images/Logo.png',
                    width: 250,
                    height: 250,
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
