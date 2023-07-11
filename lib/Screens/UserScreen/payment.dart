import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/Screens/TransportationScreen/Widgets/custom_button.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';
import 'package:tripdash/model/payment_model.dart';
import 'package:tripdash/model/user_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static String routeName = "/PaymentScreen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {










  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [







              ],
            ),
          ),
        ));
  }
}


