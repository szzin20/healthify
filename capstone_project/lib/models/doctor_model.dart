class Doctor {
  final String doctorName;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int numberOfReviews;
  final String price;
  final bool isOnline;

  Doctor({
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.numberOfReviews,
    required this.price,
    required this.isOnline,
  });
}
