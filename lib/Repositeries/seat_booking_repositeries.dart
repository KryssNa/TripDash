import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';
import 'package:tripdash/model/user_model.dart';

class SeatBookingRepositery {
  static final userId = FirebaseAuth.instance.currentUser!.uid;

  static Future<UserModel> getLoggedInUser() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      return UserModel(
        userId: userId,
        email: snapshot['email'],
        name: snapshot['name'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<SeatBookingModel> bookSeat({
    required int total,
    required String noOfTickets,
    required String sourceLocation,
    required String tranportationId,
    required String destinationLocation,
    required String date,
    required List<String> seatNumbers,
  }) async {
    try {
      UserModel? user = await UserRepositeries.getLoggedInUser();
      int? balance = user?.balance!;
      balance = balance! - total;
      final transactionRef =
      FirebaseFirestore.instance.collection('transactions').doc();

      // Update the user's balance in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'balance': balance});

      // Create a transaction document in Firestore
      final transactionData = {
        'transactionId': transactionRef.id,
        'userId': userId,
        'noOfTickets': noOfTickets,
        'tranportationId': tranportationId,
        'sourceLocation': sourceLocation,
        'destinationLocation': destinationLocation,
        'date': date,
        'seatNumbers': seatNumbers,
        'total': total,
      };

      await transactionRef.set(transactionData);

      return SeatBookingModel(
        transactionId: transactionRef.id,
        userId: userId,
        total: total,
        tranportationId: tranportationId,
        noOfTickets: noOfTickets,
        sourceLocation: sourceLocation,
        destinationLocation: destinationLocation,
        date: date,
        seatNumbers: seatNumbers,
      );
    } catch (error) {
      // Handle any errors that occur during the transaction
      if (kDebugMode) {
        print('Transaction failed: $error');
      }
      rethrow;
    }
  }

  static Future<int> getTotalBalance() async {
    try {
      UserModel? user = await UserRepositeries.getLoggedInUser();
      int? balance = user?.balance!;
      return balance!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<SeatBookingModel>> getTransactionsByUserId() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs
          .map((doc) => SeatBookingModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
