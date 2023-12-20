import 'package:capstone_project/models/api/status_med_transaction_api.dart';
import 'package:capstone_project/models/med_tran_detail_model.dart';
import 'package:flutter/material.dart';

class StatusMedPaymentProvider extends ChangeNotifier {

  MedTranDetail? _statusData; 
  MedTranDetail? get statusData => _statusData;

  Future<void> fetchStatusData(int id) async {
    try {
      _statusData = await StatusMedTransactionApi.getStatusTransaction(id);
      notifyListeners();
    } catch (e) {
      // Log error details
      rethrow;
    }
  }
}
