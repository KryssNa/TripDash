import 'package:flutter/material.dart';

class UserBookings extends StatefulWidget {
  static String routeName = "/UserBookings";
  const UserBookings({Key? key}) : super(key: key);

  @override
  State<UserBookings> createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bookings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookingCard(
                title: 'Hotel Booking',
                description: 'Book a hotel for your stay',
                onTap: () {
                  // Handle hotel booking tap
                },
              ),
              BookingCard(
                title: 'Place Booking',
                description: 'Book a place to visit',
                onTap: () {
                  // Handle place booking tap
                },
              ),
              BookingCard(
                title: 'Package Booking',
                description: 'Book a vacation package',
                onTap: () {
                  // Handle package booking tap
                },
              ),
            ],
          ),
        ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const BookingCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}