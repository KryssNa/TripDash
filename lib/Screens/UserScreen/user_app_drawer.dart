import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AuthenticationScreen/register_screen.dart';
import 'package:tripdash/Screens/UserScreen/Event/calender.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:intl/intl.dart';
import 'dart:async';
class UserAppDrawer extends StatefulWidget {
  const UserAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/UserAppDrawer';

  @override
  State<UserAppDrawer> createState() => _UserAppDrawerState();
}

class _UserAppDrawerState extends State<UserAppDrawer> {
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
        await firestore.collection('Admin').doc('Admin_1').get();

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
                child: Image.asset(
                  avatar,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          accountName: Padding(
            padding: const EdgeInsets.all(.0),
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
            leading: const Icon(Icons.place_outlined),
            title: const Text("Place"),
            onTap: () => Navigator.pushReplacementNamed(
                context, TripPlanDetails.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.hotel_outlined),
            title: const Text("Hotels"),
            onTap: () => Navigator.pushReplacementNamed(
                context, AdminAddHotels.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Trip Plan Overview"),
            onTap: () => Navigator.pop(context, TripPlanOverview.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Product"),
            onTap: () => Navigator.pop(context, RegisterScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Calender"),
            onTap: () => Navigator.pushReplacementNamed(
                context, Calender.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text("Exit"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
