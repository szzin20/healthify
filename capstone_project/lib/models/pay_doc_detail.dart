// To parse this JSON data, do
//
//     final payDoc = payDocFromJson(jsonString);

import 'dart:convert';

PayDoc payDocFromJson(String str) => PayDoc.fromJson(json.decode(str));

String payDocToJson(PayDoc data) => json.encode(data.toJson());

class PayDoc {
    Meta? meta;
    Results? results;

    PayDoc({
        this.meta,
        this.results,
    });

    factory PayDoc.fromJson(Map<String, dynamic> json) => PayDoc(
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
    String? fullname;
    String? specialist;
    int? price;
    String? paymentMethod;
    String? paymentStatus;
    String? paymentConfirmation;
    DateTime? createdAt;

    Results({
        this.id,
        this.fullname,
        this.specialist,
        this.price,
        this.paymentMethod,
        this.paymentStatus,
        this.paymentConfirmation,
        this.createdAt,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        fullname: json["fullname"],
        specialist: json["specialist"],
        price: json["price"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        paymentConfirmation: json["payment_confirmation"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "specialist": specialist,
        "price": price,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "payment_confirmation": paymentConfirmation,
        "created_at": createdAt?.toIso8601String(),
    };
}
