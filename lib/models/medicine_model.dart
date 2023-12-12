class Medicine {
  final int id;
  final String code;
  final String name;
  final String merk;
  final String category;
  final String type;
  final double price;
  final int stock;
  final String details;
  final String image;

  Medicine({
    required this.id,
    required this.code,
    required this.name,
    required this.merk,
    required this.category,
    required this.type,
    required this.price,
    required this.stock,
    required this.details,
    required this.image,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      merk: json['merk'],
      category: json['category'],
      type: json['type'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      details: json['details'],
      image: json['image'],
    );
  }
}
