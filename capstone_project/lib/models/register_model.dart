// ignore_for_file: avoid_print

class RegisterModel {
  String? email;
  String? name;
  String? password;

  RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  factory RegisterModel.fromJson(json) {
    try {
      return RegisterModel(
        name: json["Fullname"],
        email: json["Email"],
        password: json["Password"],
      );
    } catch (e) {
      print('Error parsing RegisterModel from JSON: $e, JSON: $json');
      return RegisterModel(email: '', name: '', password: '');
    }
  }

  Map<String, dynamic> toJson() => {
        "Fullname": name,
        "Email": email,
        "Password": password,
      };
}
