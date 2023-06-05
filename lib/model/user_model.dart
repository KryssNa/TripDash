// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.fcmToken,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  String? userId;
  String? fcmToken;
  String? name;
  String? email;
  String? phone;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["user_id"],
      fcmToken: json["fcm_token"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"]);

  factory UserModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
          userId: json["user_id"],
          fcmToken: json["fcm_token"],
          name: json["name"],
          email: json["email"],
          phone: json["phone"],
          password: json["password"]);

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fcm_token": fcmToken,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password
  };
}
