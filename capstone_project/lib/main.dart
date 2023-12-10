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
<<<<<<< HEAD
    return ChangeNotifierProvider(
      create: (context) => MedicineProvider(),
      child: MaterialApp(
        title: 'Medicine App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MedicineListScreen(),
      ),
=======
    return MaterialApp(
      title: 'Healthify',
      theme: ThemeData(
        fontFamily: 'FontRoboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: login(),
>>>>>>> feat/accountScreen
    );
  }
}
