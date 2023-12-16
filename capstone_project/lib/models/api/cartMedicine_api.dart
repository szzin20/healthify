import 'package:capstone_project/models/cartMedicine_model.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<CartMedicine?> postMedicinesPayment(CartMedicine cartMedicine) async {
    try {
      final response = await _dio.post(
        'https://dev.healthify.my.id/users/medicines-payments',
        data: cartMedicineToJson(cartMedicine),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // Add any other headers as needed
          },
        ),
      );

      if (response.statusCode == 200) {
        return CartMedicine.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
        print(response.data);
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}

void main() async {
  final apiClient = ApiClient();

  // Create a sample CartMedicine object
  final cartMedicine = CartMedicine(
    meta: Meta(success: true, message: 'Success'),
    results: Results(
      name: 'aditya',
      address: 'cengkareng',
      hp: '0812345678910',
      paymentMethod: 'manual transfer bca',
      medicineDetails: [
        MedicineDetail(medicineId: 2, quantity: 2),
      ],
    ),
  );

  // Make the POST request
  final result = await apiClient.postMedicinesPayment(cartMedicine);

  // Handle the result
  if (result != null) {
    print('Success: ${result.meta?.message}');
    print('Transaction ID: ${result.results?.id}');
  } else {
    print('Error: Failed to make the request.');
  }
}
