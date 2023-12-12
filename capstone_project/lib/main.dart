import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/provider/article_provider/article_list_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_list_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/bottom_bar/bottom_bar_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/account_provider/contact_us_provider/contact_us_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MedicineProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RegisterProvider(),
      ),
      ChangeNotifierProvider(
          create: (context) => OtpProvider(
              Provider.of<RegisterProvider>(context, listen: false))),
      ChangeNotifierProvider(
        create: (context) => ContactUsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DoctorsListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArticlesListProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine App',
      theme: ThemeData(
        fontFamily: 'FontRoboto',
        colorSchemeSeed: ThemeColor().primaryFrame,
        useMaterial3: true,
      ),
      home: const BottomBarScreen(),
    );
  }
}
