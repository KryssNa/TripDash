import 'package:flutter/material.dart';

class BusBooking extends StatefulWidget {
  const BusBooking({Key? key}) : super(key: key);

  @override
  State<BusBooking> createState() => _BusBookingState();
}

class _BusBookingState extends State<BusBooking> {
  List<Booking> bookings = [
    Booking("Bus 1", "ABC Bus Company", "2023-07-15"),
    Booking("Bus 2", "XYZ Bus Company", "2023-07-20"),
    Booking("Bus 3", "PQR Bus Company", "2023-07-25"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookings",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.orange[50],
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 4.0,
              child: ListTile(
                leading: Icon(
                  Icons.directions_bus,
                  size: 32.0,
                  color: Colors.orange,
                ),
                title: Text(
                  booking.busName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  booking.busCompany,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  booking.date,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  // Handle booking tap event
                  print("Selected booking: ${booking.busName}");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Booking {
  final String busName;
  final String busCompany;
  final String date;

  Booking(this.busName, this.busCompany, this.date);
}
