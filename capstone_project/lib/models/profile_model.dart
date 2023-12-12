import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final Meta meta;
  final Results results;

  ProfileModel({
    required this.meta,
    required this.results,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        meta: Meta.fromJson(json["meta"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results.toJson(),
      };
}

class Meta {
  final bool success;
  final String message;

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
  final String fullname;
  final String email;
  final String profilePicture;
  final String gender;
  final String birthdate;
  final String bloodType;
  final int height;
  final int weight;

  Results({
    required this.fullname,
    required this.email,
    required this.profilePicture,
    required this.gender,
    required this.birthdate,
    required this.bloodType,
    required this.height,
    required this.weight,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        fullname: json["fullname"],
        email: json["email"],
        profilePicture: json["profile_picture"],
        gender: json["gender"],
        birthdate: json["birthdate"],
        bloodType: json["blood_type"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "profile_picture": profilePicture,
        "gender": gender,
        "birthdate": birthdate,
        "blood_type": bloodType,
        "height": height,
        "weight": weight,
      };
}
