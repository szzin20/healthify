import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/login_provider/check_user_password_provider.dart';
import 'package:capstone_project/provider/login_provider/login_process_provider.dart';
import 'package:capstone_project/screens/home_screen/home_screen.dart';
import 'package:capstone_project/screens/register/register_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/google_button_widget.dart';
import 'package:capstone_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        color: ThemeColor().textChat,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 203,
              height: 82,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Logo.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masuk',
                style: ThemeTextStyle().hadlineSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 35),
            CustomTextField(
              title: 'Username',
              hintText: 'Input username/email',
              controller: userController,
              onChanged: (value) {
                Provider.of<CheckLoginProvider>(context, listen: false)
                    .fetchUsername(userController.text);
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'Password',
              hintText: 'Input password',
              obscureText: true,
              controller: passwordController,
              onChanged: (value) {
                Provider.of<CheckLoginProvider>(context, listen: false)
                    .fetchPassword(passwordController.text);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    //ke halaman lupa password
                  },
                  child: Text(
                    'Lupa Password?',
                    style: ThemeTextStyle().titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Consumer<CheckLoginProvider>(
                builder: (context, checkLogin, _) {
                  return ButtonWidget(
                    title: 'Login',
                    onPressed:
                        (checkLogin.user.isEmpty || checkLogin.pass.isEmpty)
                            ? null
                            : () async {
                                final loginProvider =
                                    Provider.of<LoginProcessProvider>(context,
                                        listen: false);

                                await loginProvider.sendLoginData(
                                    checkLogin.user, checkLogin.pass);

                                final loginResult = loginProvider.login;

                                if (loginResult?.meta.success == false) {
                                  // Handle login failure (e.g., show an error message)
                                } else {
                                  SharedPreferencesUtils.setToken(
                                      loginResult?.results.token ?? '');
                                  SharedPreferencesUtils.setNama(
                                      loginResult?.results.fullname ?? '');
                                  SharedPreferencesUtils.setLoggedIn(true);
                                  print(loginResult?.results.token);

                                  navigatorKey.currentState?.pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Atau login menggunakan',
              style: TextStyle(
                color: Color(0xff999999),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            GoogleButtonWidget(onPressed: () {
              // menuju google
            }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun? ',
                  style: ThemeTextStyle().titleMedium,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Daftar disini',
                    style: ThemeTextStyle().titleMedium.copyWith(
                          color: ThemeColor().primaryFrame,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
