import 'dart:io';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController _datePickerController = TextEditingController();
  TextEditingController get datePickerController => _datePickerController;

  final DropdownController _golonganDarahController = DropdownController();
  DropdownController get golonganDarahController => _golonganDarahController;

  final DropdownController _jenisKelaminController = DropdownController();
  DropdownController get jenisKelaminController => _jenisKelaminController;

  late ImageProvider<Object> _profileImage = const AssetImage('assets/images/profile_pic.jpg');

  ImageProvider<Object> get profileImage => _profileImage;

  TextEditingController tbController = TextEditingController();
  TextEditingController bbController = TextEditingController();

  final DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

   set profileImage(ImageProvider<Object> image) {
    _profileImage = image;
    notifyListeners();
  }

  Future<void> removeImage() async {
    profileImage = const AssetImage(''); // Set to empty image
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      profileImage = FileImage(File(pickedFile.path));
    }
    notifyListeners();
  }

    final List<CoolDropdownItem<String>> golonganDarahDropdownItem = [
    CoolDropdownItem(label: 'O-', value: 'O-'),
    CoolDropdownItem(label: 'O+', value: 'O+'),
    CoolDropdownItem(label: 'A-', value: 'A-'),
    CoolDropdownItem(label: 'A+', value: 'A+'),
    CoolDropdownItem(label: 'B-', value: 'B-'),
    CoolDropdownItem(label: 'B+', value: 'B+'),
    CoolDropdownItem(label: 'AB-', value: 'AB-'),
    CoolDropdownItem(label: 'AB+', value: 'AB+'),
  ];

   final List<CoolDropdownItem<String>> jenisKelaminDropdownItem = [
    CoolDropdownItem(label: 'Laki - laki', value: 'male'),
    CoolDropdownItem(label: 'Perempuan', value: 'female'),
  ];
}

