import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PlaceModel? placeModelFromJson(String str) => PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel? data) => json.encode(data!.toJson());

class PlaceModel {
  PlaceModel({
    this.placeId,
    this.placeName,
    this.description,
    this.price,
    this.location,
    this.imagepath,
    this.imageUrl,
  });

  String? placeId;
  String? placeName;
  String? description;
  String? price;
  String? location;
  String? imagepath;
  String? imageUrl;

  factory PlaceModel.fromJson(
      Map<String, dynamic> json) => PlaceModel(
    placeId: json["place_id"],
    placeName: json["place_name"],
    description: json["description"],
    price: json["price"],
    location: json["location"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "place_id": placeId,
    "place_name": placeName,
    "description": description,
    "price": price,
    "location": location,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory PlaceModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => PlaceModel(
    placeId: json.id,
    placeName: json["place_name"],
    description: json["description"],
    price: json["price"],
    location: json["location"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );
}
