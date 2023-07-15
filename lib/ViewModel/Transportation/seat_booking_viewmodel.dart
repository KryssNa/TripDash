import 'package:flutter/foundation.dart';
import 'package:tripdash/Repositeries/seat_booking_repositeries.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';

class SeatBookingViewModel {
  Future<SeatBookingModel> bookSeat({
    required int total,
    required String noOfTickets,
    required String sourceLocation,
    required String tranportationId,
    required String destinationLocation,
    required String date,
    required List<String> seatNumbers,
  }) async {
    try {
      return await SeatBookingRepositery.bookSeat(
        total: total,
        noOfTickets: noOfTickets,
        tranportationId: tranportationId,
        sourceLocation: sourceLocation,
        destinationLocation: destinationLocation,
        date: date,
        seatNumbers: seatNumbers,
      );
    } catch (error) {
      if (kDebugMode) {
        print('Transaction failed: $error');
      }
      rethrow;
    }
  }

  Future<int> getTotalBalance() async {
    try {
      return await SeatBookingRepositery.getTotalBalance();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SeatBookingModel>> getBookedSeatByUserId() async {
    try {
      return await SeatBookingRepositery.getTransactionsByUserId();
    } catch (e) {
      rethrow;
    }
  }
}
