import 'package:capstone_project/provider/account_provider/profile_provider/profile_provider.dart';
import 'package:capstone_project/provider/article_provider/all_articles_provider.dart';
import 'package:capstone_project/provider/article_provider/article_byid_provider.dart';
import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:capstone_project/provider/chatbot_provider/chatbot_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_provider.dart';
import 'package:capstone_project/provider/history_pay_provider/history_pay_provider.dart';
import 'package:capstone_project/provider/login_provider/login_process_provider.dart';
import 'package:capstone_project/provider/medicine_provider/cart_provider/cart_provider.dart';
import 'package:capstone_project/provider/medicine_provider/check_payment_info_provider.dart';
import 'package:capstone_project/provider/medicine_provider/med_payment_provider.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_by_id_provider.dart';
import 'package:capstone_project/provider/doctor_provider/menu_doctor_provider.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/provider/article_provider/article_list_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_by_id_provider.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_list_provider.dart';
import 'package:capstone_project/provider/login_provider/check_user_password_provider.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_provider.dart';
import 'package:capstone_project/provider/register_provider/otp_provider.dart';
import 'package:capstone_project/provider/register_provider/register_process_provider.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:capstone_project/provider/status_payment_provider/status_med_payment_provider.dart';
import 'package:capstone_project/provider/status_payment_provider/status_payment_provider.dart';
import 'package:capstone_project/screens/account/account_screen.dart';
import 'package:capstone_project/screens/account/contact_us/contact_us_screen.dart';
import 'package:capstone_project/screens/artikel/artikel.dart';
import 'package:capstone_project/screens/cart/cart_screen.dart';
import 'package:capstone_project/screens/chatbot/chatbot_screen.dart';
import 'package:capstone_project/screens/detail_articles_screen/detail_articles_screen.dart';
import 'package:capstone_project/screens/detail_dokter_screen/detail_doctor_screen.dart';
import 'package:capstone_project/screens/detail_product_screen/detail_product_screen.dart';
import 'package:capstone_project/screens/history_list_screen/consultation_history_screen.dart';
import 'package:capstone_project/screens/history_list_screen/history_pay_screen.dart';
import 'package:capstone_project/screens/history_list_screen/history_screen.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/login/login_screen.dart';
import 'package:capstone_project/screens/medicine_list/medicine_list_screen.dart';
import 'package:capstone_project/screens/notification/notification_screen.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:capstone_project/screens/splash_screen/splash_screen.dart';
import 'package:capstone_project/screens/view_available_doctor/doctor_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'provider/account_provider/contact_us_provider/contact_us_provider.dart';

void main() async {
  await initializeDateFormatting('id_ID');
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
        create: (context) => RegisterProcessProvider(),
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
      ChangeNotifierProvider(
        create: (context) => AllArticlesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ArticleByIdProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MedicineByIdProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MedicineByIdProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ChatBotProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartDatabaseProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MedPaymentProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CheckPaymentInfoProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StatusMedPaymentProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StatusPaymentProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FetchPayDataProvider(),
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
        '/articleList': (BuildContext context) => const ArtikelScreen(),
        '/findMed': (BuildContext context) => const MedicineListScreen(),
        '/history': (BuildContext context) => const HistoryScreen(),
        '/account': (BuildContext context) => const AccountScreen(),
        '/detailMed': (BuildContext context) => const DetailProductScreen(),
        '/detailArticle': (BuildContext context) => const DetailArticleScreen(),
        '/detailDoctor': (BuildContext context) => const DetailDoctorScreen(),
        '/cart': (BuildContext context) => const CartScreen(),
        '/buyMed': (BuildContext context) => const CartScreen(),
        '/notif': (BuildContext context) => const NotificationScreen(),
        '/contactUs': (BuildContext context) => const ContactUsScreen(),
       '/consultHistory': (BuildContext context) =>
            const ConsultationHistoryScreen(),
        '/medHistory': (BuildContext context) => const HistoryMedScreen(),
        '/chatbot': (BuildContext context) => const ChatBotScreen(),
      },

      home: const HistoryMedScreen(),
      // initialRoute: '/splash',
    );
  }
}