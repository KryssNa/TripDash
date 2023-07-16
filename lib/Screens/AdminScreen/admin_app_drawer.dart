import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_place.dart';
import 'package:tripdash/Screens/AdminScreen/add_product.dart';
import 'package:tripdash/Screens/AdminScreen/admin_dashboard.dart';
import 'package:tripdash/Screens/AdminScreen/admin_transaction.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';

import 'CustomerDetail/customer_detail.dart';

class AdminAppDrawer extends StatefulWidget {
  const AdminAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/AdminDashboard';

  @override
  State<AdminAppDrawer> createState() => _AdminAppDrawerState();
}

class _AdminAppDrawerState extends State<AdminAppDrawer> {
  String name = '';
  String avatar = '';
  String email = '';
  late Timer _timer;
  String formattedDateTime = '';

  @override
  void initState() {
    super.initState();
    fetchData();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        formattedDateTime =
            DateFormat('yyyy-MM-dd ').format(DateTime.now());
      });
    });
  }

  Future<void> fetchData() async {
    AuthViewModel authViewModel = AuthViewModel();
    final user = authViewModel.loggedInUser!;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('users').doc(user.userId).get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        name = data['name'] ?? '';
        email = data['email'] ?? '';
        avatar = data['avatar'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('hh-mm-ss').format(now);
    var userAccountsDrawerHeader = UserAccountsDrawerHeader(
          currentAccountPicture: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset(avatar==''?'Assets/avatars/av_1.png':avatar,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,),
              ),
            ),
          ),
          accountName: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 19,
              ),
            ),
          ),
          accountEmail: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                email,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
              Text(
                formattedTime,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              
            ],
          ),
          decoration:  BoxDecoration(
          
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFBDACE),
          ),
        );
    return Drawer(
      child: ListView(
        children: [
          userAccountsDrawerHeader,
      
          ListTile(
            leading: const Icon(Icons.home,color: Colors.green,size: 30,),
            title:  Text("Home",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AdminDashboard.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.place_outlined,color: Colors.green,size: 30,),
            title:  Text("Add Place",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AdminAddPlaces.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.hotel_outlined,color: Colors.green,size: 30,),
            title:  Text("Add Hotels",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AdminAddHotels.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline,color: Colors.green,size: 30,),
            title:  Text("Add Product",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AddProduct.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline,color: Colors.green,size: 30,),
            title:  Text("Add Events",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AddProduct.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline,color: Colors.green,size: 30,),
            title:  Text("Customer Details",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, CustomerDetail.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined,color: Colors.green,size: 30,),
            title:  Text("Transaction",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pushNamed(context, AdminTransactionScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined,color: Colors.green,size: 30,),
            title:  Text("Exit",style:GoogleFonts.robotoSlab(fontSize: 18,fontWeight: FontWeight.w500),),
            onTap: () => Navigator.pop(context),
          ),

        ],
      ),
    );
  }
}





