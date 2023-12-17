// To parse this JSON data, do
//
//     final riwayatTransaksiModel = riwayatTransaksiModelFromJson(jsonString);

import 'dart:convert';

RiwayatTransaksiModel riwayatTransaksiModelFromJson(String str) =>
    RiwayatTransaksiModel.fromJson(json.decode(str));

String riwayatTransaksiModelToJson(RiwayatTransaksiModel data) =>
    json.encode(data.toJson());

class RiwayatTransaksiModel {
  Meta meta;
  Results results;

  RiwayatTransaksiModel({
    required this.meta,
    required this.results,
  });

  factory RiwayatTransaksiModel.fromJson(Map<String, dynamic> json) =>
      RiwayatTransaksiModel(
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
  String fullname;
  String specialist;
  int price;
  String paymentMethod;
  String paymentStatus;
  String paymentConfirmation;
  DateTime createdAt;

  Results({
    required this.id,
    required this.fullname,
    required this.specialist,
    required this.price,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.paymentConfirmation,
    required this.createdAt,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        fullname: json["fullname"],
        specialist: json["specialist"],
        price: json["price"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        paymentConfirmation: json["payment_confirmation"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "specialist": specialist,
        "price": price,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "payment_confirmation": paymentConfirmation,
        "created_at": createdAt.toIso8601String(),
      };
}
