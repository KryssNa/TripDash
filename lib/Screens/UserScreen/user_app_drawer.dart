import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/Event/calender.dart';
import 'package:tripdash/Screens/UserScreen/Event/view_events.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:tripdash/Screens/HotelViewScreen/hotel_home_screen.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';

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
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('users').doc(user.uid).get();

      if (snapshot.exists) {
        var data = snapshot.data()!;
        setState(() {
          name = data['name'] ?? '';
          email = data['email'] ?? '';
          avatar = data['avatar'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    var userAccountsDrawerHeader = UserAccountsDrawerHeader(
          currentAccountPicture: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset(avatar==''?'Assets/avatars/av_1.png':avatar,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,),
              ),
            ),
          ),
          accountName: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
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
            onTap: () =>
                Navigator.pushNamed(context, PlaceHomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.hotel_outlined),
            title: const Text("Hotels"),
            onTap: () =>
                Navigator.pushNamed(context, HotelHomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.event_note_outlined),
            title: const Text("Events"),
            onTap: () => Navigator.pushNamed(
                context, ViewEvents.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Trip Plan Overview"),
            onTap: () =>
                Navigator.pushNamed(context, TripPlanOverview.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Product"),
            onTap: () => Navigator.pushNamed(context, ViewProducts.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Calender"),
            onTap: () => Navigator.pushNamed(
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

