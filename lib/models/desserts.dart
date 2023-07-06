class Desserts {
  Desserts({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.img,
    required this.quantity,
  });

  final int? id;
  final String? name;
  final int? price;
  final String? description;
  final String? img;
  final int? quantity;

  factory Desserts.fromJson(Map<String, dynamic> json){
    return Desserts(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      description: json["description"],
      img: json["img"],
      quantity: json["quantity"],
    );
  }

}
