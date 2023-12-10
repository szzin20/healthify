import 'package:capstone_project/provider/account_screen/contact_us_screen/contact_us_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          primarySwatch: Colors.blue,
        ),
        home: const MedicineListScreen(),
      ),
    );
  }
}
