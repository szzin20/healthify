import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  int _selectedMenuIndex = 0;

  int get selectedMenuIndex => _selectedMenuIndex;

  void setMenuIndex(int index) {
    _selectedMenuIndex = index;
    notifyListeners();
  }

  final List<String> doctorItems = [
    'Dokter Umum',
    'Spesialis Anak',
    'Spesialis Kulit',
    'Psikolog Klinis',
    'Kandungan',
    'Dokter Gigi',
    'Seksologi'
  ];
}
