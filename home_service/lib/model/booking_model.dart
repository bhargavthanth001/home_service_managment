// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  String? id;
  String serviceName;
  double servicePrice;
  double count;
  double totalPrice;
  String userId;
  String userName;
  String address;
  bool isConfirmed;
  String bookedAt;

  BookingModel({
    this.id,
    required this.serviceName,
    required this.servicePrice,
    required this.count,
    required this.totalPrice,
    required this.userId,
    required this.userName,
    required this.address,
    required this.isConfirmed,
    required this.bookedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        serviceName: json["serviceName"],
        servicePrice: json["servicePrice"]?.toDouble(),
        count: json["count"]?.toDouble(),
        totalPrice: json["totalPrice"]?.toDouble(),
        userId: json['userId'],
        userName: json["userName"],
        address: json["address"],
        isConfirmed: json["isConfirmed"],
        bookedAt: json["bookedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceName": serviceName,
        "servicePrice": servicePrice,
        "count": count,
        "totalPrice": totalPrice,
        "userId": userId,
        "userName": userName,
        "address": address,
        "isConfirmed": isConfirmed,
        "bookedAt": bookedAt,
      };
}
