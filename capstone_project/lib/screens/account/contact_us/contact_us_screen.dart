import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/account/contact_us/widget/text_field_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool isEnable = false;

  String? errorTextNama;
  String? errorTextEmail;

  String namaValue = "";
  String emailValue = "";
  String pesanValue = "";

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final pesanController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    pesanController.dispose();
    super.dispose();
  }

  void namaOnChanged(String namaValue) {
    if (namaValue.isEmpty == true) {
      errorTextNama = null;
      isEnable = false;
    } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(namaValue)) {
      errorTextNama = 'Woops! No special characters or numbers..';
      isEnable = false;
    } else {
      errorTextNama = null;
      isEnable = true;
    }
  }

  void emailOnChanged(String emailValue) {
    if (emailValue.isEmpty == true) {
      errorTextEmail = null;
      isEnable = false;
    } else if (EmailValidator.validate(emailValue) == false) {
      errorTextEmail = "Please enter a valid email";
      isEnable = false;
    } else {
      errorTextEmail = null;
      isEnable = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            backgroundColor: ThemeColor().primaryFrame,
            foregroundColor: Colors.white,
            title: Text(
              'Hubungi Kami',
              style: ThemeTextStyle().titleMedium,
            ),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1 / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/contact_us_vector.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 60,
                      color: ThemeColor().primaryFrame,
                      textColor: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/call_icon.svg'),
                          Text(
                            'Call',
                            style: ThemeTextStyle().labelLargeBold,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 60,
                      color: ThemeColor().primaryFrame,
                      textColor: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/email_icon.svg'),
                          Text(
                            'Email',
                            style: ThemeTextStyle().labelLargeBold,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 60,
                      color: ThemeColor().primaryFrame,
                      textColor: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/chat_icon.svg'),
                          Text(
                            'Chat',
                            style: ThemeTextStyle().labelLargeBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Sampaikan isu Anda, Kami siap membantu!',
                  style: ThemeTextStyle().bodyMedium,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  onChanged: (val) {
                    namaValue = val;
                    namaOnChanged(namaValue);
                    setState(() {});
                  },
                  errorText: errorTextNama,
                  controller: namaController,
                  label: 'Nama',
                  hintText: 'Nama Lengkap',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  onChanged: (val) {
                    emailValue = val;
                    emailOnChanged(emailValue);
                    setState(() {});
                  },
                  errorText: errorTextEmail,
                  controller: emailController,
                  label: 'Email',
                  hintText: 'Email Aktif',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  onChanged: (val) {
                    pesanValue = val;
                    setState(() {});
                  },
                  controller: pesanController,
                  label: 'Pesan',
                  hintText: 'Masukkan Pesan...',
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    textColor: Colors.white,
                    disabledColor: ThemeColor().primaryButton,
                    onPressed: namaValue.isNotEmpty &&
                            emailValue.isNotEmpty &&
                            pesanValue.isNotEmpty &&
                            isEnable == true
                        ? () {
                            namaController.clear();
                            emailController.clear();
                            pesanController.clear();
                          }
                        : null,
                    color: ThemeColor().primaryButtonActive,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 36,
                    child: Text(
                      'Kirim',
                      style: ThemeTextStyle().actionButtonSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
