import 'dart:convert';

Profile profileModelFromJson(String str) =>
    Profile.fromJson(json.decode(str));

String profileModelToJson(Profile data) => json.encode(data.toJson());

class Profile {
  final ProfileMeta meta;
  final ProfileResults results;

  Profile({
    required this.meta,
    required this.results,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        meta: ProfileMeta.fromJson(json["meta"]),
        results: ProfileResults.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results.toJson(),
      };
}

class ProfileMeta {
  final bool success;
  final String message;

  ProfileMeta({
    required this.success,
    required this.message,
  });

  factory ProfileMeta.fromJson(Map<String, dynamic> json) => ProfileMeta(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

class ProfileResults {
  final String fullname;
  final String email;
  final String profilePicture;
  final String gender;
  final String birthdate;
  final String bloodType;
  final int height;
  final int weight;

  ProfileResults({
    required this.fullname,
    required this.email,
    required this.profilePicture,
    required this.gender,
    required this.birthdate,
    required this.bloodType,
    required this.height,
    required this.weight,
  });

  factory ProfileResults.fromJson(Map<String, dynamic> json) => ProfileResults(
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