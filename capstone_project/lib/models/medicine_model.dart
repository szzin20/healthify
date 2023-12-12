// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
    Meta meta;
    List<Result> results;
    Pagination pagination;

    Medicine({
        required this.meta,
        required this.results,
        required this.pagination,
    });

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        meta: Meta.fromJson(json["meta"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
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

class Pagination {
    int offset;
    int limit;
    int total;

    Pagination({
        required this.offset,
        required this.limit,
        required this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
    };
}

class Result {
    int id;
    String code;
    String name;
    String merk;
    String category;
    String type;
    int price;
    int stock;
    String details;
    String image;

    Result({
        required this.id,
        required this.code,
        required this.name,
        required this.merk,
        required this.category,
        required this.type,
        required this.price,
        required this.stock,
        required this.details,
        required this.image,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
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
