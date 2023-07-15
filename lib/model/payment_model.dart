import 'package:cloud_firestore/cloud_firestore.dart';

class TopUpPayment {
  String? id;
  String? userId;
  String? amount;
  String? image;
  String? status;
  String? date;
  String? userName;

  TopUpPayment({this.id, this.amount, this.image, this.status, this.date,this.userId, this.userName});

  TopUpPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    userId = json['userId'];
    amount = json['amount'];
    image = json['image'];
    status = json['status'];
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['userId'] = userId;
    data['amount'] = amount;
    data['image'] = image;
    data['status'] = status;
    data['date'] = date;
    return data;
  }

  factory TopUpPayment.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json)=> TopUpPayment(
    //
    id: json["id"],
    userName: json["userName"],
    userId: json["userId"],
    amount: json["amount"],
    image: json["image"],
    status: json["status"],
    date: json["date"],
  );
}