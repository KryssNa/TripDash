import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';

import 'package:get/get.dart';
import 'package:tripdash/Screens/AdminScreen/AddProduct.dart';
import 'package:tripdash/Screens/UserScreen/Profile/UpdateUserProfile.dart';
import 'Helper/multiProvider.dart';
import 'NavigationPage/routes.dart';
import '../Screens/UserScreen/Profile/UserProfile.dart';
import 'Screens/AdminScreen/AdminDashboard.dart';
import 'Screens/AdminScreen/addhotel.dart';
import 'Screens/UserScreen/UserDashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return multiProvider(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: UserDashboard.routeName,
        routes: routes,
      ),
    );
  }
}
 