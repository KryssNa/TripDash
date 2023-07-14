import 'package:flutter/material.dart';

class AirplaneBooking extends StatefulWidget {
  const AirplaneBooking({Key? key}) : super(key: key);

  @override
  State<AirplaneBooking> createState() => _AirplaneBookingState();
}

class _AirplaneBookingState extends State<AirplaneBooking>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  List<Booking> bookings = [
    Booking("Flight 1", "ABC Airlines", "2023-07-15"),
    Booking("Flight 2", "XYZ Airlines", "2023-07-20"),
    Booking("Flight 3", "PQR Airlines", "2023-07-25"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flights Booking",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3e7dc3),
        elevation: 0.0,
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          color: Colors.blue[50],
          child: ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return SlideTransition(
                position: _animation.drive(
                  Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  elevation: 4.0,
                  child: ListTile(
                    leading: const Icon(
                      Icons.flight,
                      size: 32.0,
                      color: Colors.blue,
                    ),
                    title: Text(
                      booking.flightName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      booking.airline,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: Text(
                      booking.date,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Booking {
  final String flightName;
  final String airline;
  final String date;

  Booking(this.flightName, this.airline, this.date);
}
