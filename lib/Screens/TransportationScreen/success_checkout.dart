import 'package:flutter/material.dart';
import 'package:tripdash/Screens/TransportationScreen/my_transportation_bookings.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';

import 'Widgets/custom_button.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/image_success.png'))),
            ),
            Text(
              'Well Booked 😍',
              style: ConstFonts.blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: ConstFonts.semiBold,
              ),
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: ConstFonts.greyTextStyle.copyWith(fontSize: 16, fontWeight: ConstFonts.light),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyBookings.routeName, (route) => false);
              },
              width: 220,
              margin: const EdgeInsets.only(top: 50),
            )
          ],
        ),
      ),
    );
  }
}
