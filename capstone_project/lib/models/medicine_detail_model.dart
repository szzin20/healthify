class MedicineDetail {
  final int medicineId;
  final int quantity;

  MedicineDetail({required this.medicineId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'medicine_id': medicineId,
      'quantity': quantity,
    };
  }
}

