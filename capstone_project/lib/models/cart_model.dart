class Result {
  int id;
  String code;
  String name;
  String merk;
  String category;
  String type;
  int price;
  int stock;
  String details;
  String image;
  int quantity; // Add this line

  Result({
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
    required this.quantity, // Add this line
  });

  Result copyWith({int? id, int? quantity}) {
    return Result(
      id: id ?? this.id,
      code: code,
      name: name,
      merk: merk,
      category: category,
      type: type,
      price: price,
      stock: stock,
      details: details,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }


  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        merk: json["merk"],
        category: json["category"],
        type: json["type"],
        price: json["price"],
        stock: json["stock"],
        details: json["details"],
        image: json["image"],
        quantity: json["quantity"], // Add this line
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "merk": merk,
        "category": category,
        "type": type,
        "price": price,
        "stock": stock,
        "details": details,
        "image": image,
        "quantity": quantity, // Add this line
      };
}
