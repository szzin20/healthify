import 'package:capstone_project/provider/account_screen/contact_us_screen/contact_us_provider.dart';
import 'package:capstone_project/provider/doctor_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/provider/menu_doctor_provider.dart';
import 'package:capstone_project/provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:capstone_project/widgets/menu_doctor_widget.dart';
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
        create: (context) => OtpProvider(Provider.of<RegisterProvider>(context, listen: false))
      ),
      ChangeNotifierProvider(
        create: (context) => ContactUsProvider(),
      ),
       ChangeNotifierProvider(
        create: (context) => DoctorProvider(),
      ),
        ChangeNotifierProvider(
        create: (context) => MenuProvider(),
      ),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DoctorScreen(),
    );
  }
}
