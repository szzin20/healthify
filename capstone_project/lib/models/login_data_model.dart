// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
    Meta? meta;
    Results? results;

    LoginData({
        this.meta,
        this.results,
    });

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
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
    String?  fullname;
    String? email;
    String? token;

    Results({
        this.fullname,
        this.email,
        this.token,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        fullname: json["fullname"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "token": token,
    };
}
