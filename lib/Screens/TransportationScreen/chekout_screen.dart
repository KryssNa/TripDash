
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/seat_booking_repositeries.dart';
import 'package:tripdash/Screens/TransportationScreen/success_checkout.dart';
import 'package:tripdash/ViewModel/Transportation/seat_booking_viewmodel.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';
import 'package:tripdash/model/Transportation/seat_booking_model.dart';
import 'Widgets/booking_details_item.dart';
import 'Widgets/custom_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key,required this.selectedSeats,required this.totalPrice, required this.tranportationId,}) : super(key: key) ;
  final List<String> selectedSeats ;
  final double totalPrice ;
  final String sourceLocation = 'Kathmandu';
  final String destinationLocation = 'Pokhara';
  final String date = '2023-06-28';
  final String tranportationId ;


  void fetchTotalBalance() async {
    try {
      int totalBalance = await SeatBookingRepositery.getTotalBalance();
      if (kDebugMode) {
        print('Total balance: $totalBalance');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching total balance: $error');
      }
    }
  }
  void pushToSuccessPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SuccessCheckoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void wellBooked() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Well Booked',style: TextStyle(color: Colors.green),),
            content: const Text('Your seat has been booked successfully',),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SuccessCheckoutPage()));
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    double grandTotal=0 ;
    grandTotal=totalPrice + (totalPrice * 0.15);
    // Example usage
    void performTransaction(BuildContext context) async {
      try {
        final GlobalKey<State> dialogKey = GlobalKey<State>();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              key: dialogKey,
              child: const CircularProgressIndicator(),
            );
          },
        );

        int total = grandTotal.toInt();
        String noOfTickets = selectedSeats.length.toString();
        List<String> seatNumbers = selectedSeats;

        try {
          SeatBookingModel transaction = await SeatBookingViewModel().bookSeat(
            total: total,
            noOfTickets: noOfTickets,
            sourceLocation: sourceLocation,
            tranportationId: tranportationId,
            destinationLocation: destinationLocation,
            date: date,
            seatNumbers: seatNumbers,
          );
          if (kDebugMode) {
            print(transaction.transactionId);
          }
        } catch (error) {
          if (kDebugMode) {
            print('Error performing transaction: $error');
          }
        }
        Navigator.pop(dialogKey.currentContext!);
        wellBooked();
      } catch (error) {
        Navigator.pop(context);
        if (kDebugMode) {
          print('Transaction failed: $error');
        }
      }
    }
// Call the performTransaction() function to initiate the transaction
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/image_checkout.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TIA',
                      style: ConstFonts.blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: ConstFonts.medium,),
                    ),
                    Text(
                      'Kathmandu',
                      style: ConstFonts.greyTextStyle.copyWith(fontWeight: ConstFonts.light,),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PIA',
                      style: ConstFonts.blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: ConstFonts.semiBold,
                          ),
                    ),
                    Text(
                      'Pokhara',
                      style: ConstFonts.greyTextStyle.copyWith(fontWeight: ConstFonts.light
                          , ),
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
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: ConstColors.kWhiteColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //NOTE : DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('Assets/images/image_destination1.png'))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake PhewaTal',
                      style: ConstFonts.blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: ConstFonts.medium,

                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('Pokhara',
                        style: ConstFonts.greyTextStyle.copyWith(fontWeight: ConstFonts.light,
                            )),
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
                    margin: const EdgeInsets.only(right: 2),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Assets/icons/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    '4.8',
                    style: ConstFonts.blackTextStyle.copyWith(
                      fontWeight: ConstFonts.medium,

                    ),
                  )
                ],
              ),
            ],
          ),

          //NOTE : BOOKING DETAIL LIST
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: ConstFonts.semiBold,
                color: ConstColors.kBlackColor,
              ),
            ),
          ),

          //NOTE : BOOKING DETAILS ITEM
          BookingDetailsItem(
              title: 'Traveler',
              valueText: '${selectedSeats.length} persons',
              valueColor: ConstColors.kBlackColor),
          BookingDetailsItem(
              title: 'Seat', valueText: selectedSeats.toString(), valueColor: ConstColors.kBlackColor),
          BookingDetailsItem(
              title: 'Insurance', valueText: 'YES', valueColor: ConstColors.kGreenColor),
          BookingDetailsItem(
              title: 'Refundable', valueText: 'NO', valueColor: ConstColors.kRedColor),
          BookingDetailsItem(
              title: 'VAT', valueText: '15%', valueColor: ConstColors.kBlackColor),
          BookingDetailsItem(
              title: 'Price',
              valueText: 'RS. $totalPrice',
              valueColor: ConstColors.kBlackColor),
          BookingDetailsItem(
              title: 'Grand Total',
              valueText: 'RS. $grandTotal',
              valueColor: ConstColors.kPrimaryColor),
        ]),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: ConstColors.kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: ConstFonts.semiBold,
                color: ConstColors.kBlackColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('Assets/images/image_card.png')),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    AssetImage('Assets/icons/icon_plane.png'))),
                          ),
                          Text(
                            'Pay',
                            style: TextStyle(
                                fontSize: 16, fontWeight: ConstFonts.medium,
                                color: ConstColors.kWhiteColor),
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
                              return const CircularProgressIndicator();
                              // Display a loading indicator while waiting for data
                            } else
                              if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else
                            {
                              int? totalBalance = snapshot.data ; // Retrieve the total balance or set a default value
                              return Text(
                                'Rs. ${totalBalance ?? 0}',

                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: ConstFonts.medium,
                                  color: ConstColors.kBlackColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Current Balance',
                          style: TextStyle(fontWeight: ConstFonts.light,
                              color: ConstColors.kGreyColor
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
        onPressed: (){
          if (kDebugMode) {
            print('Performing Transaction........');
          }
          performTransaction(context);
          //alertDialog(context); to show trasaction status

        },
        margin: const EdgeInsets.only(top: 30),
      );
    }

    Widget tacButton() {
      return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Text(
            'Tearms and Conditions',
            style: TextStyle(
                fontSize: 16,
                fontWeight: ConstFonts.light,
                decoration: TextDecoration.underline,
                ),
          ));
    }

    return Scaffold(
      backgroundColor: ConstColors.kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
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
