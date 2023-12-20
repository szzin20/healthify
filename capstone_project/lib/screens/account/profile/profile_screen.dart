import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/account_provider/profile_provider/profile_provider.dart';
import 'package:capstone_project/screens/account/profile/new_pass_screen/new_pass_screen.dart';
import 'package:capstone_project/screens/account/profile/widgets/profile_tile_widget.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_profile.dart';
import 'package:capstone_project/screens/account/profile/widgets/text_field_tb_bb.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void removeImage() {
    context.read<ProfileProvider>().removeImage();
  }

  Future<void> pickImage(ImageSource source) async {
    await context.read<ProfileProvider>().pickImage(source);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        foregroundColor: Colors.white,
        title: Text(
          'Profil',
          style: ThemeTextStyle().titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 1 / 3,
                height: MediaQuery.of(context).size.height * 1 / 7,
                decoration: BoxDecoration(
                  color: profileProvider.profileImage == const AssetImage('')
                      ? Colors.grey
                      : null,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: profileProvider.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
                child: profileProvider.profileImage ==
                        const AssetImage('assets/images/profile_pic.jpg')
                    ? Center(
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            _showOptions(context, profileProvider);
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  _showOptions(context, profileProvider);
                },
                child: Text(
                  'Edit',
                  style: ThemeTextStyle().titleMedium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                SharedPreferencesUtils.getNama(),
                style: ThemeTextStyle().titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldTbBb(
                    title: 'TB',
                    hintText: 'Tinggi',
                    controller: profileProvider.tbController,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                    },
                  ),
                  const SizedBox(width: 12),
                  TextFieldTbBb(
                    title: 'BB',
                    hintText: 'Berat',
                    controller: profileProvider.bbController,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 360,
                child: Column(
                  children: [
                    ProfileTileWidget(
                      title: 'Email',
                      icon: SvgPicture.asset(
                          'assets/icons/account_screen/profile_screen/mail_icon.svg'),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'alterra123@gmail.com',
                          style: ThemeTextStyle().bodySmall,
                        ),
                      ),
                    ),
                    ProfileTileWidget(
                      title: 'Password',
                      icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/password_icon.svg',
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              '******',
                              style: ThemeTextStyle().bodySmall,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewPassScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ProfileTileWidget(
                      title: 'Nomor Ponsel',
                      icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/phone_icon.svg',
                      ),
                      content: const SizedBox(
                        height: 32,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: TextFieldProfile(
                            hintText: '-',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    ProfileTileWidget(
                      title: 'Tanggal Lahir',
                      icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/calendar_icon.svg',
                      ),
                      content: TextfieldDatePicker(
                        style: ThemeTextStyle().bodySmall,
                        textfieldDatePickerController:
                            profileProvider.datePickerController,
                        materialDatePickerFirstDate: DateTime(1970),
                        materialDatePickerLastDate: DateTime(2024),
                        materialDatePickerInitialDate:
                            profileProvider.currentDate,
                        preferredDateFormat: DateFormat('dd-MM-yyyy'),
                        cupertinoDatePickerMaximumDate: DateTime(2024),
                        cupertinoDatePickerMinimumDate: DateTime(1970),
                        cupertinoDatePickerBackgroundColor: Colors.white,
                        cupertinoDatePickerMaximumYear: 2023,
                        cupertinoDateInitialDateTime:
                            profileProvider.currentDate,
                        cursorColor: ThemeColor().primaryFrame,
                        decoration: InputDecoration(
                          hintText: 'dd-MM-yyyy',
                          hintStyle: ThemeTextStyle().bodySmall.copyWith(
                                color: ThemeColor().placeHolder,
                              ),
                          suffixIcon: const Icon(
                            Icons.calendar_month_rounded,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          filled: true,
                          fillColor: ThemeColor().textField,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: ThemeColor().primaryButtonActive,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ProfileTileWidget(
                      title: 'Jenis Kelamin',
                      icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/gender_icon.svg',
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: CoolDropdown(
                          dropdownList:
                              profileProvider.jenisKelaminDropdownItem,
                          controller: profileProvider.jenisKelaminController,
                          onChange: (value) {
                            debugPrint(value);
                          },
                          onOpen: (value) {},
                          resultOptions: ResultOptions(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            textStyle: ThemeTextStyle().bodySmall,
                            placeholder: 'P/L',
                            placeholderTextStyle:
                                ThemeTextStyle().bodySmall.copyWith(
                                      color: ThemeColor().placeHolder,
                                    ),
                            render: ResultRender.all,
                            boxDecoration: BoxDecoration(
                              color: ThemeColor().textField,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            openBoxDecoration: BoxDecoration(
                              color: ThemeColor().white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ThemeColor().primaryButtonActive,
                                width: 2,
                              ),
                            ),
                          ),
                          dropdownItemOptions: DropdownItemOptions(
                            textStyle: ThemeTextStyle().bodySmall,
                            height: 30,
                            render: DropdownItemRender.all,
                            selectedPadding: EdgeInsets.zero,
                            mainAxisAlignment: MainAxisAlignment.center,
                            selectedBoxDecoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: ThemeColor()
                                      .primaryButtonActive
                                      .withOpacity(0.7),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ProfileTileWidget(
                      title: 'Golongan Darah',
                      icon: SvgPicture.asset(
                        'assets/icons/account_screen/profile_screen/blood_icon.svg',
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: CoolDropdown(
                          dropdownList:
                              profileProvider.golonganDarahDropdownItem,
                          controller: profileProvider.golonganDarahController,
                          onChange: (value) {
                            debugPrint(value);
                          },
                          onOpen: (value) {},
                          resultOptions: ResultOptions(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            textStyle: ThemeTextStyle().bodySmall,
                            placeholder: 'O/A/B/AB',
                            placeholderTextStyle:
                                ThemeTextStyle().bodySmall.copyWith(
                                      color: ThemeColor().placeHolder,
                                    ),
                            render: ResultRender.all,
                            boxDecoration: BoxDecoration(
                              color: ThemeColor().textField,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            openBoxDecoration: BoxDecoration(
                              color: ThemeColor().white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ThemeColor().primaryButtonActive,
                                width: 2,
                              ),
                            ),
                          ),
                          dropdownItemOptions: DropdownItemOptions(
                            textStyle: ThemeTextStyle().bodySmall,
                            height: 30,
                            render: DropdownItemRender.all,
                            selectedPadding: EdgeInsets.zero,
                            mainAxisAlignment: MainAxisAlignment.center,
                            selectedBoxDecoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: ThemeColor()
                                      .primaryButtonActive
                                      .withOpacity(0.7),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showOptions(
      BuildContext context, ProfileProvider profileProvider) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () async {
                  Navigator.pop(context);
                  await profileProvider.pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil Foto'),
                onTap: () async {
                  Navigator.pop(context);
                  await profileProvider.pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Hapus'),
                onTap: () {
                  Navigator.pop(context);
                  profileProvider.removeImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
