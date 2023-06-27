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

}