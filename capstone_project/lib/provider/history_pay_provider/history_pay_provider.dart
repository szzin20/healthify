import 'package:capstone_project/models/api/get_all_doc_transaction_api.dart';
import 'package:capstone_project/models/api/get_all_med_transaction_api.dart';
import 'package:capstone_project/models/pay_doc_history_model.dart';
import 'package:capstone_project/models/pay_med_history_model.dart';
import 'package:flutter/material.dart';


class FetchPayDataProvider extends ChangeNotifier {
  bool _loading = true;
  PayMedHistory? _payMedData;
  PayDocHistory? _payDocData;
  int _payOption = 1;

  PayMedHistory? get payMedData => _payMedData;
  PayDocHistory? get payDocData => _payDocData;
  int get payOption => _payOption;
  bool get loading => _loading;
   changeMenu(int option) async {
    _payOption = option;
    _loading = true; 

    if (_payOption == 1) {
      await fetchMedPayData();
    } else {
      await fetchDocPayData();
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> fetchMedPayData() async {
    try {
      final medData = await HistoryMedTransactionApi.getMedTransaction();
      _payMedData = medData;
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
  Future<void> fetchDocPayData() async {
    try {
      final doctorData = await HistoryDocTransactionApi.getDocTransaction();
      _payDocData = doctorData;
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
