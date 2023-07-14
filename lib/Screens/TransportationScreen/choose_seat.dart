import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chekout_screen.dart';


class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);
  static String routeName="/chooseSeatPage";

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  List<String> selectedSeats = [];
  double totalPrice = 0.0;

  bool isBusinessClassSeat(String seat) {
    List<String> businessClass = [
      'A1', 'A2',   'B1', 'B2',
      'A3', 'A4',   'B3', 'B4',
      'A5', 'A6',   'B5', 'B6',

    ]; // Example list of business class seats

    return businessClass.contains(seat);
  }

  bool isFirstClassSeat(String seat) {
    List<String> firstClass = [
      'A7', 'A8',   'B7', 'B8',
      'A9', 'A10',  'B9', 'B10',
      'A11', 'A12', 'B11', 'B12',
      'A13', 'A14', 'B13', 'B14',
    ]; // Example list of first class seats

    return firstClass.contains(seat);
  }

  void selectSeat(String seat) {
    setState(() {
      if(isSeatBooked(seat)) return; // If seat is booked, do nothing (return
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
        isBusinessClassSeat(seat)?totalPrice -= 50000.0:isFirstClassSeat(seat)?totalPrice -=30000.0:totalPrice -=20000.0; // Assuming seat price is 100
      } else {
        if(selectedSeats.length >= 8) {
          return; // If user has selected 4 seats, do nothing (return
        } // If user has selected 4 seats, do nothing (return
        selectedSeats.add(seat);
        isBusinessClassSeat(seat)?totalPrice += 50000.0:isFirstClassSeat(seat)?totalPrice +=30000.0:totalPrice +=20000.0;// Assuming seat price is 100
      }
    });
  }

  Color getSeatBackgroundColor(String seat) {
    if (selectedSeats.contains(seat)) {
      return Colors.green;
    } else if (isSeatBooked(seat)) {
      return Colors.red;
    } else {
      return const Color(0xffE0D9FF);
    }
  }

  Future<List<String>> fetchBookedSeats() async {
    List<String> fetchBookedSeats = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .get();

      for (var doc in querySnapshot.docs) {
        List<dynamic> seats = doc['seatNumbers'];
        fetchBookedSeats.addAll(seats.map((seat) => seat.toString()).toList());
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch booked seats: $e');
      }
    }
    return fetchBookedSeats;
  }

  List<String> bookedSeats = [];

  IconData getSeatIcon(String seat) {
    if (isSeatBooked(seat)) {
      return Icons.check_circle;
    } else {
      return Icons.airline_seat_recline_normal;
    }
  }

  @override
  void initState() {
    // // TODO: implement initState
    super.initState();
    try {
      fetchBookedSeats().then((value) {
        setState(() {
          bookedSeats = value;
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch booked seats: $e');
      }
    }
  }
  bool isSeatBooked(String seat) {
    // List<String> bookedSeats = bookedSeats;
    // Example list of booked seats
    return bookedSeats.contains(seat);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Aeroplane Seat Selection',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select your seat(s):',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(children: [
              //AVAILABLE
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: const Color(0xffdfd8fe)
                ),
              ),
              const Text(
                'Available',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),

              //SELECTED
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(left: 10, right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.green
                ),
              ),
              const Text(
                'Selected',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),

              //UNAVAILABLE
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(left: 10, right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.red
                ),
              ),
              const Text(
                  'Already Booked',
                  style: TextStyle(
                    fontSize: 16.0,
                  )
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 85.0,top: 20.0,bottom: 10),
            child: Row(
              //row A and B
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xffcdf1ed),
                  ),
                  child: const Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xff653b3b),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 155,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xffcdf1ed),
                  ),
                  child: const Center(
                    child: Text(
                      'B',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xff653b3b),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0, // Add cross-axis spacing
                mainAxisSpacing: 16.0,
              ),
              itemCount: 40,
              itemBuilder: (context, index) {
                final row = index % 2 == 0 ? 'A' : 'B';
                final column = (index ~/ 2) + 1;
                final seat = row + column.toString();
                return GestureDetector(
                  onTap: () {if(selectedSeats.length>=8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        showCloseIcon: true,
                        backgroundColor: Colors.red,
                        closeIconColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        content: Text('You can only select 8 seats'),
                      ),
                    );

                  }
                  selectSeat(seat);
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: getSeatBackgroundColor(seat),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(
                      getSeatIcon(seat),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: selectedSeats.length>9?Axis.horizontal:Axis.vertical,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selected Seats:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    selectedSeats.isNotEmpty ? selectedSeats.join(', ') : 'None',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'RS. $totalPrice',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5C40CC),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding:  const EdgeInsets.only(left: 16.0,right: 16,bottom:8),
            child: ElevatedButton(
              onPressed: () {
                if(selectedSeats.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      showCloseIcon: true,
                      backgroundColor: Colors.red,
                      closeIconColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      content: Text('Please select at least one seat'),
                    ),
                  );
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(selectedSeats: selectedSeats, totalPrice: totalPrice,tranportationId: "Aeroplane",),
                  ),
                );

               },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4ecc40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


