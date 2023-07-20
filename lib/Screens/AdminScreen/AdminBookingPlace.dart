import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminBookingPlace extends StatefulWidget {
  const AdminBookingPlace({Key? key}) : super(key: key);
  static String routeName = "/AdminBookingPlace";

  @override
  State<AdminBookingPlace> createState() => _AdminBookingPlaceState();
}

class _AdminBookingPlaceState extends State<AdminBookingPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Booking Places'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Bookings').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Data is ready, so let's process and display it.
          final bookingDocs = snapshot.data?.docs; // Use the null-aware operator here

          if (bookingDocs == null || bookingDocs.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: bookingDocs.length,
            itemBuilder: (context, index) {
              var bookingData = bookingDocs[index].data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
              String name = bookingData['name'] ?? ''; // Use null-aware operator and provide a default value
              String place = bookingData['place'] ?? '';
              String package = bookingData['package'] ?? '';
              String bus = bookingData['bus'] ?? '';
              String aeroplane = bookingData['aeroplane'] ?? '';
              String hotel = bookingData['hotel'] ?? '';

              return ListTile(
                title: Text('Name: $name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Place: $place'),
                    Text('Package: $package'),
                    Text('Bus: $bus'),
                    Text('Aeroplane: $aeroplane'),
                    Text('Hotel: $hotel'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
