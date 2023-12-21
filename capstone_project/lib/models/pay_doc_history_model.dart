// To parse this JSON data, do
//
//     final payDocHistory = payDocHistoryFromJson(jsonString);

import 'dart:convert';

PayDocHistory payDocHistoryFromJson(String str) => PayDocHistory.fromJson(json.decode(str));

String payDocHistoryToJson(PayDocHistory data) => json.encode(data.toJson());

class PayDocHistory {
    Meta? meta;
    List<Result>? results;
    Pagination? pagination;

    PayDocHistory({
        this.meta,
        this.results,
        this.pagination,
    });

    factory PayDocHistory.fromJson(Map<String, dynamic> json) => PayDocHistory(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
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

class Pagination {
    int? offset;
    int? limit;
    int? total;

    Pagination({
        this.offset,
        this.limit,
        this.total,
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
    int? id;
    String? fullname;

    Result({
        this.id,
        this.fullname,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
    };
}
