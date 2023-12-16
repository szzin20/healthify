import 'package:capstone_project/models/order_med_model.dart';

class CheckoutItemRequest {
  final String name;
  final String address;
  final String hp;
  final String paymentMethod;
  final List<MedicineDetail> medicineDetails;

  CheckoutItemRequest({
    required this.name,
    required this.address,
    required this.hp,
    required this.paymentMethod,
    required this.medicineDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'hp': hp,
      'payment_method': paymentMethod,
      'medicine_details':
          medicineDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}