import 'dart:convert';

RegisterData registerDataFromJson(String str) =>
    RegisterData.fromJson(json.decode(str));

String registerDataToJson(RegisterData data) => json.encode(data.toJson());

class RegisterData {
  Meta? meta;
  Results? results;

  RegisterData({
    this.meta,
    this.results,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
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
  String? fullname;
  String? email;
  String? password;

  Results({
    this.fullname,
    this.email,
    this.password,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "password" : password,
      };
}
