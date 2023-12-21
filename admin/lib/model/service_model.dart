import 'dart:convert';

ServiceModel serviceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  String? id;
  String name;
  String price;
  String image;
  String category;
  String rating;
  bool isSaved;
  String createdAt;
  String updatedAt;

  ServiceModel({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.isSaved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"],
        rating: json["rating"],
        isSaved: json["isSaved"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "category": category,
        "rating": rating,
        "isSaved": isSaved,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
