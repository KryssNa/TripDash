import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/TransportationScreen/chekout_screen.dart';

enum SeatType { normal, window, hood }

class Seat {
  final String id;
  final SeatType type;
  bool isSelected;
  bool isBooked;
  double price;

  Seat({
    required this.id,
    required this.type,
    this.isSelected = false,
    this.isBooked = false,
    this.price = 0.0,
  });
}

class BusSeatChoosingScreen extends StatefulWidget {
  const BusSeatChoosingScreen({Key? key}) : super(key: key);
  static const routeName = '/SeatBookingPage';

  @override
  State<BusSeatChoosingScreen> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<BusSeatChoosingScreen> {
  List<Seat> seats = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of seats
    for (int i = 1; i <= 40; i++) {
      final seatType = _getSeatType(i);
      final seatPrice = _getSeatPrice(seatType);
      seats.add(Seat(id: 'S$i', type: seatType, price: seatPrice));
    }
  }

  SeatType _getSeatType(int seatNumber) {
    // Determine the seat type based on the seat number
    if (seatNumber % 4 == 1 || seatNumber % 4 == 0) {
      return SeatType.window;
    } else if (seatNumber % 4 == 2 || seatNumber % 4 == 3) {
      return SeatType.hood;
    } else {
      return SeatType.normal;
    }
  }

  double _getSeatPrice(SeatType seatType) {
    // Determine the seat price based on the seat type
    switch (seatType) {
      case SeatType.normal:
        return 500.0;
      case SeatType.window:
        return 600.0;
      case SeatType.hood:
        return 500.0;
    }
  }
  Future<List<String>> getBookedSeats() async {
    final snapshot = await FirebaseFirestore.instance.collection('transactions').get();
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final bookedSeats = data['seatNumbers'] as List<dynamic>;
      for (final seatId in bookedSeats) {
        final seat = seats.firstWhere((seat) => seat.id == seatId);
        seat.isBooked = true;
      }
    }
    return seats.where((seat) => seat.isBooked).map((seat) => seat.id).toList();
  }

  void _selectSeat(int index) {
    setState(() {
      final selectedSeat = seats[index];
      if (!selectedSeat.isBooked) {
        selectedSeat.isSelected = !selectedSeat.isSelected;
      }
    });
  }

  Color _getSeatColor(Seat seat) {
    if (seat.isBooked) {
      return Colors.red;
    } else if (seat.isSelected) {
      return Colors.green;
    } else if (seat.type == SeatType.window) {
      return Colors.blue;
    } else if (seat.type == SeatType.hood) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  int _getSelectedSeatsCount() {
    return seats.where((seat) => seat.isSelected).length;
  }

  double _getTotalPrice() {
    double totalPrice = 0.0;
    for (final seat in seats) {
      if (seat.isSelected) {
        totalPrice += seat.price;
      }
    }
    return totalPrice;
  }

  List<String> _getSelectedSeatIds() {
    return seats.where((seat) => seat.isSelected).map((seat) => seat.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Seat Booking'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: seats.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final seat = seats[index];
          return GestureDetector(
            onTap: () => _selectSeat(index),
            child: Container(
              decoration: BoxDecoration(
                color: _getSeatColor(seat),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      seat.id,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Rs.${seat.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          Text.rich(
          TextSpan(
          children: [
            const TextSpan(
            text: 'No. of seats: ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextSpan(
            text: '${_getSelectedSeatsCount()}    ',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
            const TextSpan(
              text: '         '
                  '       '
                  ' Total Price: ',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Rs.${_getTotalPrice().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const TextSpan(
              text: '  Selected Seats: ',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '${_getSelectedSeatIds()}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),

              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _getSelectedSeatsCount() > 0
                    ? () {
                  final totalPrice = _getTotalPrice();
                  final selectedSeatIds = _getSelectedSeatIds();

                  // Proceed with the booking process
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(selectedSeats:selectedSeatIds , totalPrice: totalPrice,tranportationId: "Bus",),
                    ),
                  );
                  // Reset the selected seats
                  setState(() {
                    for (var seat in seats) {
                      seat.isSelected = false;
                    }
                  });
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                ),
                child: const Text(
                  'Book Selected Seats',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
