
import 'package:flutter/foundation.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';

class TransactionViewModel {
  Future<SeatBookingModel> bookSeat({
    required int total,
    required String noOfTickets,
    required String sourceLocation,
    required String destinationLocation,
    required String date,
    required List<String> seatNumbers,
  }) async {
    try {
      return await SeatBookingRepository.bookSeat(
        total: total,
        noOfTickets: noOfTickets,
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


}
