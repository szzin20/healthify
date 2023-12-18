// To parse this JSON data, do
//
//     final medTranDetail = medTranDetailFromJson(jsonString);

import 'dart:convert';

MedTranDetail medTranDetailFromJson(String str) => MedTranDetail.fromJson(json.decode(str));

String medTranDetailToJson(MedTranDetail data) => json.encode(data.toJson());

class MedTranDetail {
    Meta meta;
    Results results;

    MedTranDetail({
        required this.meta,
        required this.results,
    });

    factory MedTranDetail.fromJson(Map<String, dynamic> json) => MedTranDetail(
        meta: Meta.fromJson(json["meta"]),
        results: Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results.toJson(),
    };
}

class Meta {
    bool success;
    String message;

    Meta({
        required this.success,
        required this.message,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}

class Results {
    int id;
    String paymentStatus;
    int medicineTransactionId;
    MedicineTransaction medicineTransaction;
    DateTime createdAt;
    String paymentConfirmation;

    Results({
        required this.id,
        required this.paymentStatus,
        required this.medicineTransactionId,
        required this.medicineTransaction,
        required this.createdAt,
        required this.paymentConfirmation,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        paymentStatus: json["payment_status"],
        medicineTransactionId: json["medicine_transaction_id"],
        medicineTransaction: MedicineTransaction.fromJson(json["medicine_transaction"]),
        createdAt: DateTime.parse(json["created_at"]),
        paymentConfirmation: json["payment_confirmation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_status": paymentStatus,
        "medicine_transaction_id": medicineTransactionId,
        "medicine_transaction": medicineTransaction.toJson(),
        "created_at": createdAt.toIso8601String(),
        "payment_confirmation": paymentConfirmation,
    };
}

class MedicineTransaction {
    int userId;
    String name;
    String address;
    String hp;
    String paymentMethod;
    List<MedicineDetail> medicineDetails;
    int totalPrice;
    String statusTransaction;

    MedicineTransaction({
        required this.userId,
        required this.name,
        required this.address,
        required this.hp,
        required this.paymentMethod,
        required this.medicineDetails,
        required this.totalPrice,
        required this.statusTransaction,
    });

    factory MedicineTransaction.fromJson(Map<String, dynamic> json) => MedicineTransaction(
        userId: json["user_id"],
        name: json["name"],
        address: json["address"],
        hp: json["hp"],
        paymentMethod: json["payment_method"],
        medicineDetails: List<MedicineDetail>.from(json["medicine_details"].map((x) => MedicineDetail.fromJson(x))),
        totalPrice: json["total_price"],
        statusTransaction: json["status_transaction"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "address": address,
        "hp": hp,
        "payment_method": paymentMethod,
        "medicine_details": List<dynamic>.from(medicineDetails.map((x) => x.toJson())),
        "total_price": totalPrice,
        "status_transaction": statusTransaction,
    };
}

class MedicineDetail {
    int medicineId;
    int quantity;
    int totalPriceMedicine;

    MedicineDetail({
        required this.medicineId,
        required this.quantity,
        required this.totalPriceMedicine,
    });

    factory MedicineDetail.fromJson(Map<String, dynamic> json) => MedicineDetail(
        medicineId: json["medicine_id"],
        quantity: json["quantity"],
        totalPriceMedicine: json["total_price_medicine"],
    );

    Map<String, dynamic> toJson() => {
        "medicine_id": medicineId,
        "quantity": quantity,
        "total_price_medicine": totalPriceMedicine,
    };
}
