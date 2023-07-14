import 'package:flutter/material.dart';

class UserBookings extends StatelessWidget {
  static String routeName = "/UserBookings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookings',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        backgroundColor: Color(0xff3e7dc3),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          BookingCard(
            icon: Icons.hotel,
            title: 'Hotel Booking',
            description: 'Book a hotel for your stay',
            onTap: () {
              // Handle hotel booking tap
            },
          ),
          SizedBox(height: 8.0),
          BookingCard(
            icon: Icons.place,
            title: 'Place Booking',
            description: 'Book a place to visit',
            onTap: () {
              // Handle place booking tap
            },
          ),
          SizedBox(height: 8.0),
          BookingCard(
            icon: Icons.card_travel,
            title: 'Package Booking',
            description: 'Book a vacation package',
            onTap: () {
              // Handle package booking tap
            },
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const BookingCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });


}
