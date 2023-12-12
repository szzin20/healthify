// ignore_for_file: avoid_print

class OtpModel {
  String? email;
  int? otp; 

  OtpModel({
    required this.email,
    required this.otp,
  });

  factory OtpModel.fromJson(json) {
    try {
      return OtpModel(
        email: json["email"],
        otp: json["otp"] as int?,
      );
    } catch (e) {
      print('Error parsing OtpModel from JSON: $e, JSON: $json');
      return OtpModel(email: '', otp: null );
    }
  }

  Map<String, dynamic> toJson() => {
    "email" : email,
    "otp" : otp,
      };
}
