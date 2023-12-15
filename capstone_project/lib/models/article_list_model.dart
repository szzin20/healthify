// To parse this JSON data, do
//
//     final listArticles = listArticlesFromJson(jsonString);

import 'dart:convert';

ListArticles listArticlesFromJson(String str) => ListArticles.fromJson(json.decode(str));

String listArticlesToJson(ListArticles data) => json.encode(data.toJson());

class ListArticles {
    Meta? meta;
    List<Result>? results;
    Pagination? pagination;

    ListArticles({
        this.meta,
        this.results,
        this.pagination,
    });

    factory ListArticles.fromJson(Map<String, dynamic> json) => ListArticles(
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
    String? title;
    String? content;
    String? image;
    DateTime? createdAt;
    String? fullname;
    String? profilePicture;

    Result({
        this.id,
        this.title,
        this.content,
        this.image,
        this.createdAt,
        this.fullname,
        this.profilePicture,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        fullname: json["fullname"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "fullname": fullname,
        "profile_picture": profilePicture,
    };
}
