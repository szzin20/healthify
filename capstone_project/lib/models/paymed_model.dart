// To parse this JSON data, do
//
//     final payMed = payMedFromJson(jsonString);

import 'dart:convert';

PayMed payMedFromJson(String str) => PayMed.fromJson(json.decode(str));

String payMedToJson(PayMed data) => json.encode(data.toJson());

class PayMed {
    Meta? meta;
    Results? results;

    PayMed({
        this.meta,
        this.results,
    });

    factory PayMed.fromJson(Map<String, dynamic> json) => PayMed(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        results: json["results"] == null ? null : Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "results": results?.toJson(),
    };
}

class Meta {
    bool? success;
    String? message;

    Meta({
        this.success,
        this.message,
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
    int? id;
    String? paymentStatus;
    int? medicineTransactionId;
    MedicineTransaction? medicineTransaction;
    DateTime? createdAt;
    String? paymentConfirmation;

    Results({
        this.id,
        this.paymentStatus,
        this.medicineTransactionId,
        this.medicineTransaction,
        this.createdAt,
        this.paymentConfirmation,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        paymentStatus: json["payment_status"],
        medicineTransactionId: json["medicine_transaction_id"],
        medicineTransaction: json["medicine_transaction"] == null ? null : MedicineTransaction.fromJson(json["medicine_transaction"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        paymentConfirmation: json["payment_confirmation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_status": paymentStatus,
        "medicine_transaction_id": medicineTransactionId,
        "medicine_transaction": medicineTransaction?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "payment_confirmation": paymentConfirmation,
    };
}

class MedicineTransaction {
    int? userId;
    String? name;
    String? address;
    String? hp;
    String? paymentMethod;
    List<MedicineDetail>? medicineDetails;
    int? totalPrice;
    String? statusTransaction;

    MedicineTransaction({
        this.userId,
        this.name,
        this.address,
        this.hp,
        this.paymentMethod,
        this.medicineDetails,
        this.totalPrice,
        this.statusTransaction,
    });

    factory MedicineTransaction.fromJson(Map<String, dynamic> json) => MedicineTransaction(
        userId: json["user_id"],
        name: json["name"],
        address: json["address"],
        hp: json["hp"],
        paymentMethod: json["payment_method"],
        medicineDetails: json["medicine_details"] == null ? [] : List<MedicineDetail>.from(json["medicine_details"]!.map((x) => MedicineDetail.fromJson(x))),
        totalPrice: json["total_price"],
        statusTransaction: json["status_transaction"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "address": address,
        "hp": hp,
        "payment_method": paymentMethod,
        "medicine_details": medicineDetails == null ? [] : List<dynamic>.from(medicineDetails!.map((x) => x.toJson())),
        "total_price": totalPrice,
        "status_transaction": statusTransaction,
    };
}

class MedicineDetail {
    int? medicineId;
    int? quantity;
    int? totalPriceMedicine;

    MedicineDetail({
        this.medicineId,
        this.quantity,
        this.totalPriceMedicine,
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
