class Doctor {
  final int id;
  final String profilePicture;
  final String fullname;
  final String specialist;
  final int price;
  final bool status;

  Doctor({
    required this.id,
    required this.profilePicture,
    required this.fullname,
    required this.specialist,
    required this.price,
    required this.status,
  });

  // Factory method to create a Doctor instance from JSON
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      profilePicture: json['profile_picture'],
      fullname: json['fullname'],
      specialist: json['specialist'],
      price: json['price'],
      status: json['status'],
    );
  }
}
