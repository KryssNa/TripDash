import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EventModel? eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel? data) => json.encode(data!.toJson());

class EventModel {
  EventModel({
    this.eventId,
    this.title,
    this.description,
    this.date,
    this.price,
    this.location,
    this.category,
    this.imagepath,
    this.imageUrl,
  });

  String? eventId;
  String? title;
  String? description;
  DateTime? date;
  String? price;
  String? category;
  String? location;
  String? imagepath;
  String? imageUrl;

  factory EventModel.fromJson(
      Map<String, dynamic> json) => EventModel(
    eventId: json["event_id"],
    title: json["tite"],
    description: json["description"],
    date: json["date"],
    price: json["price"],
    location: json["location"],
    category: json["category"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "title": title,
    "description": description,
    "date": date,
    "price": price,
    "location": location,
    "category":category,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory EventModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => EventModel(
  eventId: json.id,
  title: json["title"],
  description: json["description"],
  date: json["date"],
  price: json["price"],
  location: json["location"],
  category:json['category'],
  imagepath: json["imagepath"],
  imageUrl: json["imageUrl"],
  );
}
