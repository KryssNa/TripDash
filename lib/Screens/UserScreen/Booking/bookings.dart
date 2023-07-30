import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserBookings extends StatefulWidget {
  static String routeName = "/UserBookings";
  const UserBookings({Key? key}) : super(key: key);

  @override
  State<UserBookings> createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {

  void pop(){
    Navigator.of(context).pop(true);
  }
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String activeUserId = user?.uid ?? "";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'User Bookings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xFF007096),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transactions')
            .where("userId", isEqualTo: activeUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final bookingDocs = snapshot.data?.docs;

          if (bookingDocs == null || bookingDocs.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: bookingDocs.length,
            itemBuilder: (context, index) {
              var bookingData = bookingDocs[index].data() as Map<String, dynamic>;
              String date= bookingData['date'] ?? '';
              String destinationLocation = bookingData['destinationLocation'] ?? '';
              String noOfTickets = bookingData['noOfTickets'] ?? '';
              List<String> seatNumbers = List<String>.from(bookingData['seatNumbers']);
              String sourceLocation = bookingData['sourceLocation'] ?? '';
              int total = bookingData['total'] ?? '';
              String transactionId = bookingData['transactionId'] ?? '';
              String userId = bookingData['userId'] ?? '';

              return Padding(
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
                      'User Id : $userId',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : $date', style: const TextStyle(fontSize: 16)),
                        Text('Destination Location: $destinationLocation', style: const TextStyle(fontSize: 16)),
                        Text('No Of Tickets: $noOfTickets', style: const TextStyle(fontSize: 16)),
                        Text('Seat Numbers: $seatNumbers', style: const TextStyle(fontSize: 16)),
                        Text('Source Location: $sourceLocation', style: const TextStyle(fontSize: 16)),
                        Text('Total: $total', style: const TextStyle(fontSize: 16)),
                        Text('TransactionId: $transactionId', style: const TextStyle(fontSize: 16)),
                      ],
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




