import 'package:capstone_project/models/api/status_transaction_api.dart';
import 'package:flutter/material.dart';

class StatusPaymentProvider extends ChangeNotifier {
  final StatusTransactionApi _api = StatusTransactionApi();
  Map<String, dynamic>? _statusData; // Use nullable type

  Map<String, dynamic>? get statusData => _statusData;

  Future<void> fetchStatusData(int limit) async {
    try {
      _statusData = await _api.getStatusTransaction(limit);
      notifyListeners();
    } catch (e) {
      // Log error details
      print('Error fetching status data: $e');
    }
  }
}
