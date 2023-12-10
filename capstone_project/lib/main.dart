import 'package:capstone_project/provider/account_screen/contact_us_screen/contact_us_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/provider/regiter_provider/otp_provider.dart';
import 'package:capstone_project/provider/regiter_provider/register_provider.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MedicineProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => OTPProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MedicineProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactUsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Medicine App',
        theme: ThemeData(
          fontFamily: 'FontRoboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
