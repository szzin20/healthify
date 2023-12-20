import 'package:capstone_project/models/api/status_transaction_api.dart';
import 'package:capstone_project/models/pay_doc_detail.dart';
import 'package:flutter/material.dart';

class StatusPaymentProvider extends ChangeNotifier {
  PayDoc? _statusData; // Use nullable type

  PayDoc? get statusData => _statusData;

  Future<void> fetchStatusData(int limit) async {
    try {
      _statusData = await StatusTransactionApi.getStatusTransaction(limit);
      notifyListeners();
    } catch (e) {
      // Log error details
      rethrow;
    }
  }
}
