// To parse this JSON data, do
//
//     final listDoctors = listDoctorsFromJson(jsonString);

import 'dart:convert';

ListDoctors listDoctorsFromJson(String str) => ListDoctors.fromJson(json.decode(str));

String listDoctorsToJson(ListDoctors data) => json.encode(data.toJson());

class ListDoctors {
    Meta meta;
    List<Result> results;
    Pagination pagination;

    ListDoctors({
        required this.meta,
        required this.results,
        required this.pagination,
    });

    factory ListDoctors.fromJson(Map<String, dynamic> json) => ListDoctors(
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
    String profilePicture;
    String fullname;
    String specialist;
    int price;

    Result({
        required this.id,
        required this.profilePicture,
        required this.fullname,
        required this.specialist,
        required this.price,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        profilePicture: json["profile_picture"],
        fullname: json["fullname"],
        specialist: json["specialist"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_picture": profilePicture,
        "fullname": fullname,
        "specialist": specialist,
        "price": price,
    };
}
