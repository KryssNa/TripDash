import 'package:flutter/material.dart';

class UserBookings extends StatefulWidget {
  static String routeName = "/UserBookings";

  @override
  State<UserBookings> createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          BookingCard(
            icon: Icons.hotel_outlined,
            title: 'Hotel Booking',
            description: 'Book a hotel for your stay',
            onTap: () {
              // Handle hotel booking tap
            },
          ),
          SizedBox(height: 8.0),
          BookingCard(
            icon: Icons.place_outlined,
            title: 'Place Booking',
            description: 'Book a place to visit',
            onTap: () {
              // Handle place booking tap
            },
          ),
          SizedBox(height: 8.0),
          BookingCard(
            icon: Icons.card_travel_outlined,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30.0,
                color: Colors.black,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
