import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/screens/account/profile/widgets/profile_tile_widget.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_profile.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_tb_bb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor().primaryFrame,
          foregroundColor: Colors.white,
          title: Text(
            'Profil',
            style: ThemeTextStyle().titleMedium,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: MediaQuery.of(context).size.width * 1 / 3,
                    height: MediaQuery.of(context).size.height * 1 / 7,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_pic.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Edit',
                    style: ThemeTextStyle().titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Mulawarman Suhendra',
                    style: ThemeTextStyle().titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldTbBb(
                        title: 'TB',
                        hintText: 'Tinggi Badan',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(width: 12),
                      TextFieldTbBb(
                        title: 'BB',
                        hintText: 'Berat Badan',
                        controller: TextEditingController(),
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ProfileTileWidget(
                    title: 'Email',
                    icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/mail_icon.svg'),
                    content: Text(
                      'mulawarman@gmail.com',
                      style: ThemeTextStyle().bodySmall,
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Password',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/password_icon.svg',
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '*******',
                          style: ThemeTextStyle().bodySmall,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Nomor Ponsel',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/phone_icon.svg',
                    ),
                    content: const TextFieldProfile(
                      hintText: '08xxxxxxxx',
                    ),
                  ),
                  ProfileTileWidget(
                    title: 'Tanggal Lahir',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/calendar_icon.svg',
                    ),
                    content: const TextFieldProfile(hintText: 'dd-mm-yyyy'),
                  ),
                  ProfileTileWidget(
                    title: 'Jenis Kelamin',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/gender_icon.svg',
                    ),
                    content:
                        const TextFieldProfile(hintText: 'Laki-laki/Perempuan'),
                  ),
                  ProfileTileWidget(
                    title: 'Golongan Darah',
                    icon: SvgPicture.asset(
                      'assets/icons/account_screen/profile_screen/blood_icon.svg',
                    ),
                    content: const TextFieldProfile(hintText: 'O/B/A/AB'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
