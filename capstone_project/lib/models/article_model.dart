// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
    Meta? meta;
    Results? results;

    Article({
        this.meta,
        this.results,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
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
    String? title;
    String? content;
    String? image;
    DateTime? createdAt;
    String? fullname;
    String? profilePicture;

    Results({
        this.id,
        this.title,
        this.content,
        this.image,
        this.createdAt,
        this.fullname,
        this.profilePicture,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
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
