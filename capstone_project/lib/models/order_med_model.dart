// To parse this JSON data, do
//
//     final orderMed = orderMedFromJson(jsonString);

import 'dart:convert';

OrderMed orderMedFromJson(String str) => OrderMed.fromJson(json.decode(str));

String orderMedToJson(OrderMed data) => json.encode(data.toJson());

class OrderMed {
    Meta? meta;
    Results? results;

    OrderMed({
        this.meta,
        this.results,
    });

    factory OrderMed.fromJson(Map<String, dynamic> json) => OrderMed(
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
    int? userId;
    String? name;
    String? address;
    String? hp;
    String? paymentMethod;
    List<MedicineDetail>? medicineDetails;
    int? totalPrice;
    String? statusTransaction;
    DateTime? createdAt;

    Results({
        this.id,
        this.userId,
        this.name,
        this.address,
        this.hp,
        this.paymentMethod,
        this.medicineDetails,
        this.totalPrice,
        this.statusTransaction,
        this.createdAt,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        address: json["address"],
        hp: json["hp"],
        paymentMethod: json["payment_method"],
        medicineDetails: json["medicine_details"] == null ? [] : List<MedicineDetail>.from(json["medicine_details"]!.map((x) => MedicineDetail.fromJson(x))),
        totalPrice: json["total_price"],
        statusTransaction: json["status_transaction"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "address": address,
        "hp": hp,
        "payment_method": paymentMethod,
        "medicine_details": medicineDetails == null ? [] : List<dynamic>.from(medicineDetails!.map((x) => x.toJson())),
        "total_price": totalPrice,
        "status_transaction": statusTransaction,
        "created_at": createdAt?.toIso8601String(),
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

