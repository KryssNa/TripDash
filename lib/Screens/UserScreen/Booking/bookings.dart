import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/Booking/airplaneBooking.dart';
import 'package:tripdash/Screens/UserScreen/Booking/busBooking.dart';
import 'package:tripdash/Screens/UserScreen/Booking/packageBooking.dart';
import 'package:tripdash/Screens/UserScreen/Booking/placeBooking.dart';
import 'package:tripdash/widget/UserBookings/bookingGestureDetector.dart';

import 'hotelBooking.dart';

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
          BookingGestureDetector(
            icon: Icons.hotel,
            title: 'Hotel Booking',
            description: 'Your bookings of hotels',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HotelBooking(),
                ),
              );
            },
          ),
          SizedBox(height: 8.0),
          BookingGestureDetector(
            icon: Icons.place,
            title: 'Place Booking',
            description: 'Your bookings of places',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlaceBooking(),
                ),
              );
            },
          ),
          SizedBox(height: 8.0),
          BookingGestureDetector(
            icon: Icons.card_travel,
            title: 'Package Booking',
            description: 'Your bookings of packages',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PackageBooking(),
                ),
              );
            },
          ),
          BookingGestureDetector(
            icon: Icons.airplanemode_active_outlined,
            title: 'Airplane Booking',
            description: 'Your bookings of plane',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AirplaneBooking(),
                ),
              );
            },
          ),
          BookingGestureDetector(
            icon: Icons.directions_bus_outlined,
            title: 'Bus Booking',
            description: 'Your bookings of bus',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BusBooking(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


