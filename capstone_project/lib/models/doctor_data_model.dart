// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
    Meta? meta;
    Results? results;

    Doctor({
        this.meta,
        this.results,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
    String? profilePicture;
    bool? status;
    String? fullname;
    String? specialist;
    int? price;
    String? alumnus;
    String? experience;
    int? noStr;
    String? locationPractice;

    Results({
        this.id,
        this.profilePicture,
        this.status,
        this.fullname,
        this.specialist,
        this.price,
        this.alumnus,
        this.experience,
        this.noStr,
        this.locationPractice,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        profilePicture: json["profile_picture"],
        status: json["status"],
        fullname: json["fullname"],
        specialist: json["specialist"],
        price: json["price"],
        alumnus: json["alumnus"],
        experience: json["experience"],
        noStr: json["no_str"],
        locationPractice: json["location_practice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_picture": profilePicture,
        "status": status,
        "fullname": fullname,
        "specialist": specialist,
        "price": price,
        "alumnus": alumnus,
        "experience": experience,
        "no_str": noStr,
        "location_practice": locationPractice,
    };
}
