import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/seat_booking_repositeries.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';


class MyBookings extends StatefulWidget {
  const MyBookings({super.key});
  static const routeName = '/my_booing';

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  late Future<List<SeatBookingModel>> _transactionsFuture;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    // Retrieve the transactions for the current user
    _transactionsFuture = SeatBookingRepositery.getTransactionsByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Seat Booking Transactions',style: TextStyle(
          color: Colors.black,
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, BottomNavigationBarWidget.routeName);
          },

        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<SeatBookingModel>>(
        future: _transactionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final transactions = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.airplane_ticket,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      transaction.tranportationId!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Total: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: transaction.total.toString(),
                              ),
                            ],
                          ),

                        ),

                        const SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Source: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: transaction.sourceLocation,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Destination: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: transaction.destinationLocation,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Seat Numbers: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),

                              TextSpan(
                                text: transaction.seatNumbers.toString(),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'TransactionId: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: transaction.transactionId,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transaction.date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                );


              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load transactions: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: Text('No transactions found.'),
            );
          }
        },
      ),
    );
  }
}
