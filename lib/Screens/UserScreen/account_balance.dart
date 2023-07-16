import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/payment.dart';
import 'package:tripdash/ViewModel/Transportation/seat_booking_viewmodel.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});
  static const routeName = '/accountBalance';

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.kWhiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ConstColors.kBlackColor,
            ),
          ),
          title: Text(
            'Wallet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: ConstFonts.bold,
              color: ConstColors.kBlackColor,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 280,
                  width: 350,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('Assets/icons/Payment.jpg')),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 72,vertical: 48 ),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: ConstColors.kWhiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Your Account Balance',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: ConstFonts.semiBold,
                            color: ConstColors.kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
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
                                    image: AssetImage(
                                        'Assets/images/image_card.png')),
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
                                              image: AssetImage(
                                                  'Assets/icons/icon_plane.png'))),
                                    ),
                                    Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: ConstFonts.medium,
                                          color: ConstColors.kWhiteColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder<int>(
                                    future: SeatBookingViewModel()
                                        .getTotalBalance(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                        // Display a loading indicator while waiting for data
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                       int? totalBalance = snapshot
                                            .data; // Retrieve the total balance or set a default value
                                        return Text(
                                          'Rs. ${totalBalance ?? 0}',
                                          style: TextStyle(
                                            fontSize: 20,
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ConstColors.kGreyColor,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 68,
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all( 24),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: ConstColors.kPrimaryColor),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PaymentScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        'Top Up',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: ConstFonts.medium,
                            color: ConstColors.kWhiteColor),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ));
  }
}
