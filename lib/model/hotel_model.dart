// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

HotelModel? hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel? data) => json.encode(data!.toJson());

class HotelModel {
  HotelModel({
    this.hotelId,
    this.hotelName,
    this.description,
    this.price,
    this.location,
    this.imagepath,
    this.imageUrl,
  });

  String? hotelId;
  String? hotelName;
  String? description;
  String? price;
  String? location;
  String? imagepath;
  String? imageUrl;

  factory HotelModel.fromJson(
      Map<String, dynamic> json) => HotelModel(
    hotelId: json["hotel_id"],
    hotelName: json["hotel_name"],
    description: json["description"],
    price: json["price"],
    location: json["location"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "hotel_id": hotelId,
    "hotel_name": hotelName,
    "description": description,
    "price": price,
    "location": location,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory HotelModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => HotelModel(
  hotelId: json.id,
  hotelName: json["hotel_name"],
  description: json["description"],
  price: json["price"],
  location: json["location"],
  imagepath: json["imagepath"],
  imageUrl: json["imageUrl"],
  );
}
