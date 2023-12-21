// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String fName;
  String lName;
  String email;
  String mobile;
  String createdAt;

  UserModel({
    this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.mobile,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fName: json["fName"],
        lName: json["lName"],
        email: json["email"],
        mobile: json["mobile"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fName": fName,
        "lName": lName,
        "email": email,
        "mobile": mobile,
        "createdAt": createdAt,
      };
}
