import 'package:capstone_project/provider/doctor_provider.dart';
import 'package:capstone_project/provider/login_provider/login_process_provider.dart';
import 'package:capstone_project/provider/medicine_provider/cart_provider/cart_provider.dart';
import 'package:capstone_project/provider/menu_doctor_provider.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/provider/article_provider/article_list_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_by_id_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_list_provider.dart';
import 'package:capstone_project/provider/login_provider/check_user_password_provider.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_provider.dart';
import 'package:capstone_project/provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/account/contact_us/contact_us_screen.dart';
import 'package:capstone_project/screens/detail_dokter_screen/detail_doctor_screen.dart';
import 'package:capstone_project/screens/history_consultation_doctor/consultation_history_screen.dart';
import 'package:capstone_project/screens/history_consultation_doctor/history_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/screens/medicine_list/cart/cart_screen.dart';
import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
import 'package:capstone_project/screens/pay_doctor/consultation_fee.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:capstone_project/screens/splash_screen/splash_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/account_provider/contact_us_provider/contact_us_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DoctorByIdProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AllMedicineProvider(),
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
        create: (context) => DoctorProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MenuProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DoctorsListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArticlesListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckLoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LoginProcessProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
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
      debugShowCheckedModeBanner: false,
      title: 'Medicine App',
      theme: ThemeData(
        fontFamily: 'FontRoboto',
        colorSchemeSeed: ThemeColor().primaryFrame,
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashScreen(),
        '/register': (BuildContext context) => const RegisterScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/doctorList': (BuildContext context) => const DoctorScreen(),
        '/articleList': (BuildContext context) => const Center(),
        '/findMed': (BuildContext context) => const MedicineListScreen(),
        '/history': (BuildContext context) => const HistoryScreen(),
        '/account': (BuildContext context) => const AccountScreen(),
        '/detailMed': (BuildContext context) => const AccountScreen(),
        '/detailArticle': (BuildContext context) => const AccountScreen(),
        '/detailDoctor': (BuildContext context) => const DetailDoctorScreen(),
        '/notif': (BuildContext context) => const AccountScreen(),
        '/contactUs': (BuildContext context) => const ContactUsScreen(),
        '/consultHistory': (BuildContext context) => const ConsultationHistoryScreen(),
        '/medHistory': (BuildContext context) => const AccountScreen(),
        '/cart': (BuildContext context) => const CartScreen(),
      },
      // initialRoute: '/splash',
      initialRoute: '/splash',
    );
  }
}
