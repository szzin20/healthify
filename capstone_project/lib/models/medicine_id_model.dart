// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
    Meta? meta;
    Results? results;

    Medicine({
        this.meta,
        this.results,
    });

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
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
    String? code;
    String? name;
    String? merk;
    String? category;
    String? type;
    int? price;
    int? stock;
    String? details;
    String? image;

    Results({
        this.id,
        this.code,
        this.name,
        this.merk,
        this.category,
        this.type,
        this.price,
        this.stock,
        this.details,
        this.image,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        merk: json["merk"],
        category: json["category"],
        type: json["type"],
        price: json["price"],
        stock: json["stock"],
        details: json["details"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "merk": merk,
        "category": category,
        "type": type,
        "price": price,
        "stock": stock,
        "details": details,
        "image": image,
    };
}
