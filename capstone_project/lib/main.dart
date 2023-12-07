// import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
// import 'package:capstone_project/screens/pay_doctor/consultation_fee.dart';
// import 'package:capstone_project/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MedicineProvider(),
      child: MaterialApp(
        title: 'Healthify',
        theme: ThemeData(
          fontFamily: 'FontRoboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MedicineListScreen(),
      ),
    );
  }
}
