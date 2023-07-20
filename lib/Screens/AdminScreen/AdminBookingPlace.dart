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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Admin Booking Places',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFF007096),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Bookings').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final bookingDocs = snapshot.data?.docs;

          if (bookingDocs == null || bookingDocs.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: bookingDocs.length,
            itemBuilder: (context, index) {
              var bookingData = bookingDocs[index].data() as Map<String, dynamic>;
              String name = bookingData['name'] ?? '';
              String place = bookingData['place'] ?? '';
              String package = bookingData['package'] ?? '';
              String bus = bookingData['bus'] ?? '';
              String aeroplane = bookingData['aeroplane'] ?? '';
              String hotel = bookingData['hotel'] ?? '';

              return Dismissible(
                key: Key(bookingDocs[index].id),
                direction: DismissDirection.endToStart, // Changed the direction to endToStart
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirm Deletion'),
                      content: Text('Are you sure you want to delete this booking?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    await FirebaseFirestore.instance.collection('Bookings').doc(bookingDocs[index].id).delete();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Booking deleted successfully!'),
                    ));
                  }
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight, // Changed the alignment to centerRight
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'Name: $name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Place: $place', style: TextStyle(fontSize: 16)),
                          Text('Package: $package', style: TextStyle(fontSize: 16)),
                          Text('Bus: $bus', style: TextStyle(fontSize: 16)),
                          Text('Aeroplane: $aeroplane', style: TextStyle(fontSize: 16)),
                          Text('Hotel: $hotel', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
