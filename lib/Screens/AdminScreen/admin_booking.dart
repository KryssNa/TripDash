import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminBooking extends StatefulWidget {
  const AdminBooking({Key? key}) : super(key: key);
  static String routeName = "/AdminBooking";

  @override
  State<AdminBooking> createState() => _AdminBookingState();
}

class _AdminBookingState extends State<AdminBooking> {

  void pop(){
    Navigator.of(context).pop(true);
  }
  @override
  Widget build(BuildContext context) {
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
            'Admin Booking',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xFF007096),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('transactions').where("status", isEqualTo: "pending").snapshots(),
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
              String bookingId = bookingDocs[index].id;

              return Dismissible(
                key: Key(bookingId),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm Deletion'),
                      content: const Text('Are you sure you want to delete this booking?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    await FirebaseFirestore.instance.collection('transactions').doc(bookingId).delete();
                  }
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
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
                      trailing: TextButton(
                        onPressed: () {
                          BuildContext dialogContext = context;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm Approval"),
                                content: const Text("Are you sure you want to approve this booking?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(dialogContext).pop(false), // Use the captured context
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await FirebaseFirestore.instance.collection('transactions').doc(bookingId).update({
                                        'status': 'approved',
                                      });
                                      pop();
                                    },
                                    child: const Text("Approve", style: TextStyle(color: Colors.blue)), // Approve button with blue text color
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Button background color
                        ),
                        child: const Text(
                          'Approve',
                          style: TextStyle(color: Colors.white, fontSize: 16), // Button text color
                        ),
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
