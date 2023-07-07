import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ProductModel? productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel? data) => json.encode(data!.toJson());

class ProductModel {
  ProductModel({
    this.productId,
    this.productName,
    this.category,
    this.price,
    this.offer,
    this.imagepath,
    this.imageUrl,
  });

  String? productId;
  String? productName;
  String? category;
  String? price;
  String? offer;
  String? imagepath;
  String? imageUrl;

  factory ProductModel.fromJson(
      Map<String, dynamic> json) => ProductModel(
    productId: json["productId"],
    productName: json["productName"],
    category: json["category"],
    price: json["price"],
    offer: json["offer"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "category": category,
    "price": price,
    "offer": offer,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory ProductModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => ProductModel(
    productId: json.id,
    productName: json["productName"],
    category: json["category"],
    price: json["price"],
    offer: json["offer"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );
}
