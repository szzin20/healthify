import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/account_provider/contact_us_provider/contact_us_provider.dart';
import 'package:capstone_project/screens/account/contact_us/widgets/card_button_widget.dart';
import 'package:capstone_project/screens/account/contact_us/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final contactUsProvider = Provider.of<ContactUsProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor().primaryFrame,
          foregroundColor: Colors.white,
          title: Text(
            'Hubungi Kami',
            style: ThemeTextStyle().titleMedium,
          ),
          centerTitle: true,
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
                    CardButtonWidget(
                      label: 'Call',
                      svgIconAsset:
                          'assets/icons/account_screen/contact_us_screen/call_icon.svg',
                      onPressed: () {},
                    ),
                    CardButtonWidget(
                      label: 'Email',
                      svgIconAsset:
                          'assets/icons/account_screen/contact_us_screen/email_icon.svg',
                      onPressed: () {},
                    ),
                    CardButtonWidget(
                      label: 'Chat',
                      svgIconAsset:
                          'assets/icons/account_screen/contact_us_screen/chat_icon.svg',
                      onPressed: () {},
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
                    contactUsProvider.namaOnChanged(val);
                  },
                  errorText: contactUsProvider.errorTextNama,
                  controller: contactUsProvider.namaController,
                  label: 'Nama',
                  hintText: 'Nama Lengkap',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  onChanged: (val) {
                    contactUsProvider.emailOnChanged(val);
                  },
                  errorText: contactUsProvider.errorTextEmail,
                  controller: contactUsProvider.emailController,
                  label: 'Email',
                  hintText: 'Email Aktif',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  onChanged: (val) {
                    contactUsProvider.pesanOnChanged(val);
                  },
                  controller: contactUsProvider.pesanController,
                  label: 'Pesan',
                  hintText: 'Masukkan Pesan...',
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: Consumer<ContactUsProvider>(
                    builder: (context, contactUsProvider, child) {
                      return MaterialButton(
                        textColor: Colors.white,
                        disabledColor: ThemeColor().primaryButton,
                        onPressed: contactUsProvider.kirimButtonValidation(),
                        color: ThemeColor().primaryButtonActive,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 36,
                        child: Text(
                          'Kirim',
                          style: ThemeTextStyle().actionButtonSmall,
                        ),
                      );
                    },
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
