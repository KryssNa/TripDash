import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/seat_booking_repositeries.dart';
import 'package:tripdash/ViewModel/Transportation/seat_booking_viewmodel.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';
import 'Widgets/booking_details_item.dart';
import 'Widgets/custom_button.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key,required this.selectedSeats,required this.totalPrice, this.grandTotal}) : super(key: key);
  final List<String> selectedSeats ;
  final double totalPrice ;
  double? grandTotal ;

  void fetchTotalBalance() async {
    try {
      int totalBalance = await SeatBookingRepositery.getTotalBalance();
      print('Total balance: $totalBalance');
    } catch (error) {
      print('Error fetching total balance: $error');
    }
  }


  @override
  Widget build(BuildContext context) {

    Color kPrimaryColor = Color(0xff5C40CC);
    Color kBlackColor = Color(0xff1F1449);
    Color kWhiteColor = Color(0xffFFFFFF);
    Color kGreyColor = Color(0xff9698A9);
    Color kGreenColor = Color(0xff0EC3AE);
    Color kRedColor = Color(0xffEB70A5);
    Color kBackgroundColor = Color(0xffFAFAFA);
    FontWeight light = FontWeight.w300;
    FontWeight medium = FontWeight.w500;
    FontWeight semiBold = FontWeight.w600;



    // final user = FirebaseAuth.instance.currentUser;
    // final userId = user?.uid;
    // final userData = FirebaseFirestore.instance.collection('users').doc(userId).get();
    // UserRepositeries userService = UserRepositeries();
    // grandTotal=totalPrice + (totalPrice * 0.15);

    // Example usage
    void performTransaction(BuildContext context) async {
      try {
        // Show a circular progress indicator while performing the transaction
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Provide the required data for the transaction
        int total = grandTotal!.toInt();
        String noOfTickets = selectedSeats.length.toString();
        String sourceLocation = 'Location A';
        String destinationLocation = 'Location B';
        String date = '2023-06-28';
        List<String> seatNumbers = selectedSeats;

        // Call the Transaction() method
         SeatBookingModel transaction = await SeatBookingViewModel().bookSeat(
          total: total,
          noOfTickets: noOfTickets,
          sourceLocation: sourceLocation,
          destinationLocation: destinationLocation,
          date: date,
          seatNumbers: seatNumbers,
        );
        print(transaction.transactionId);

        // The transaction was successful
        Navigator.pop(context); // Dismiss the progress indicator
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>SuccessCheckoutPage()
        //     //     TransactionSuccessfulPage(
        //     //   transactionId: transaction.transactionId,
        //     // ),
        //   ),
        // );
      } catch (error) {
        // Handle any errors that occur during the transaction
        Navigator.pop(context); // Dismiss the progress indicator
        print('Transaction failed: $error');
      }
    }

// Call the performTransaction() function to initiate the transaction


    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: TextStyle(
                          fontSize: 24, fontWeight: medium, color: kBlackColor),
                    ),
                    Text(
                      'Tangerang',
                      style: TextStyle(fontWeight: light, color: kGreyColor),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: TextStyle(
                          fontSize: 24, fontWeight: semiBold,
                          color: kBlackColor),
                    ),
                    Text(
                      'Ciliwung',
                      style: TextStyle(fontWeight: light
                          , color: kGreyColor),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //NOTE : DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image_destination1.png'))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake Ciliwung',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: medium,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Tangerang',
                        style: TextStyle(fontWeight: light,
                            color: kGreyColor)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontWeight: medium,
                      color: kBlackColor,
                    ),
                  )
                ],
              ),
            ],
          ),

          //NOTE : BOOKING DETAIL LIST
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: semiBold,
                color: kBlackColor,
              ),
            ),
          ),

          //NOTE : BOOKING DETAILS ITEM
          BookingDetailsItem(
              title: 'Traveler',
              valueText: selectedSeats.length.toString()+' persons',
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: 'Seat', valueText: selectedSeats.toString(), valueColor: kBlackColor),
          BookingDetailsItem(
              title: 'Insurance', valueText: 'YES', valueColor: kGreenColor),
          BookingDetailsItem(
              title: 'Refundable', valueText: 'NO', valueColor: kRedColor),
          BookingDetailsItem(
              title: 'VAT', valueText: '15%', valueColor: kBlackColor),
          BookingDetailsItem(
              title: 'Price',
              valueText: 'RS. $totalPrice',
              valueColor: kBlackColor),
          BookingDetailsItem(
              title: 'Grand Total',
              valueText: 'RS. $grandTotal',
              valueColor: kPrimaryColor),
        ]),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: semiBold,
                color: kBlackColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image_card.png')),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    AssetImage('assets/icon_plane.png'))),
                          ),
                          Text(
                            'Pay',
                            style: TextStyle(
                                fontSize: 16, fontWeight: medium,
                                color: kWhiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<int>(
                          future: SeatBookingViewModel().getTotalBalance(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator(); // Display a loading indicator while waiting for data
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              int totalBalance = snapshot.data ?? 0; // Retrieve the total balance or set a default value

                              return Text(
                                'Rs. $totalBalance',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: medium,
                                  color: kBlackColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Current Balance',
                          style: TextStyle(fontWeight: light,
                              color: kGreyColor
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      );
    }

    Widget payNowButton() {
      return CustomButton(
        title: 'Pay Now',
        onPressed: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => SuccessCheckoutPage()));
          // },
          print('Performing Transaction........');
          performTransaction(context);

        },
        margin: EdgeInsets.only(top: 30),
      );
    }

    Widget tacButton() {
      return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Text(
            'Tearms and Conditions',
            style: TextStyle(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
                color: kPrimaryColor),
          ));
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton()
        ],
      ),
    );
  }
}
