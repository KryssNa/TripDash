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
    this.balance,
    this.role
  });

  String? userId;
  String? fcmToken;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? role;
  int? balance;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["user_id"],
      fcmToken: json["fcm_token"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      balance: json["balance"],
      role: json["role"],
      password: json["password"]);

  factory UserModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
          userId: json["user_id"],
          fcmToken: json["fcm_token"],
          name: json["name"],
          email: json["email"],
          phone: json["phone"],
          role: json["role"],
          balance: json["balance"],
          password: json["password"]);

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fcm_token": fcmToken,
    "name": name,
    "email": email,
    "phone": phone,
    "balance":balance,
    "password": password,
    "role": role
  };
}
