import 'package:flutter/material.dart';

class AirplaneBooking extends StatefulWidget {
  const AirplaneBooking({Key? key}) : super(key: key);

  @override
  State<AirplaneBooking> createState() => _AirplaneBookingState();
}

class _AirplaneBookingState extends State<AirplaneBooking>  with SingleTickerProviderStateMixin {
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
      duration: Duration(milliseconds: 500),
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
        title: Text("My Bookings"),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return SlideTransition(
              position: _animation.drive(
                Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ),
              ),
              child: ListTile(
                title: Text(booking.flightName),
                subtitle: Text(booking.airline),
                trailing: Text(booking.date),
              ),
            );
          },
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