// import 'package:capstone_project/provider/medicine_provider.dart';
// import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MedicineProvider(),
//       child: MaterialApp(
//         title: 'Medicine App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MedicineListScreen(),
//       ),
//     );
//   }
// }

import 'package:capstone_project/screens/pay_doctor/consultation_fee.dart';
import 'package:capstone_project/screens/payment_detail/payment_detail_screen.dart';
import 'package:capstone_project/widgets/feedback_doctor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Your App Title',
      home: FeedBackDoctor(),
    );
  }
}
