import 'package:flutter/material.dart';
import 'package:tripdash/ViewModel/Transportation/seat_booking_viewmodel.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

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
            'Payment',
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
                  height: 240,
                  width: 350,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('Assets/icons/Payment.jpg')),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

              ],
            ),
          ),
        ));
  }
}
