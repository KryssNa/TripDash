import 'package:cloud_firestore/cloud_firestore.dart';

class SeatBookingModel {
  final String? userId;
  final String? transactionId;
  final int? total;
  final String noOfTickets;
  final String sourceLocation;
  final String destinationLocation;
  final String date;
  final List<String> seatNumbers;

  SeatBookingModel({
    this.userId,
    required this.transactionId,
    required this.total,
    required this.noOfTickets,
    required this.sourceLocation,
    required this.destinationLocation,
    required this.date,
    required this.seatNumbers,
  });

  factory SeatBookingModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return SeatBookingModel(
      userId: data['userId'] ?? '',
      transactionId: data['transactionId'] ?? '',
      total: data['total'] ?? 0,
      noOfTickets: data['noOfTickets'] ?? '',
      sourceLocation: data['sourceLocation'] ?? '',
      destinationLocation: data['destinationLocation'] ?? '',
      date: data['date'] ?? '',
      seatNumbers: List<String>.from(data['seatNumbers']) ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'transactionId': transactionId,
      'total': total,
      'noOfTickets': noOfTickets,
      'sourceLocation': sourceLocation,
      'destinationLocation': destinationLocation,
      'date': date,
      'seatNumbers': seatNumbers,
    };
  }

}