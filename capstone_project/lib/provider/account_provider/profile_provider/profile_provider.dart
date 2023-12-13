import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController _datePickerController = TextEditingController();
  TextEditingController get datePickerController => _datePickerController;

  final DropdownController _golonganDarahController = DropdownController();
  DropdownController get golonganDarahController => _golonganDarahController;

  final GroupButtonController _jenisKelaminController = GroupButtonController();
  GroupButtonController get jenisKelaminController => _jenisKelaminController;
}
