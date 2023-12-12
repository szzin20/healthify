import 'package:capstone_project/provider/account_screen/contact_us_screen/contact_us_provider.dart';
import 'package:capstone_project/provider/article_provider/article_list_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_by_id_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_list_provider.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/detail_dokter_screen/detail_doctor_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:capstone_project/screens/splash_screen/splash_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DoctorByIdProvider(),
      ),
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
      home: const DetailDoctorScreen(),
      routes: <String, WidgetBuilder>{
        '_': (BuildContext context) => const SplashScreen(),
        '/register': (BuildContext context) => const RegisterScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/doctorList': (BuildContext context) => const DoctorScreen(),
        '/articleList': (BuildContext context) => const Center(),
        '/findMed': (BuildContext context) => const Center(),
        '/history': (BuildContext context) => const Center(),
        '/account': (BuildContext context) => const AccountScreen(),
        '/detailMed': (BuildContext context) => const AccountScreen(),
        '/detailarticle': (BuildContext context) => const AccountScreen(),
        '/detailDoctor': (BuildContext context) => const DetailDoctorScreen(),
        '/notif': (BuildContext context) => const AccountScreen(),
        '/contactUs': (BuildContext context) => const AccountScreen(),
        '/consultHistory': (BuildContext context) => const AccountScreen(),
        '/medHistory': (BuildContext context) => const AccountScreen(),
      },
    );
  }
}
