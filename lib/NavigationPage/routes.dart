import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/LoginScreen.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
//import 'package:tripdash/Screens/UserScreen/TripPan/trip_plan_detail.dart';
//import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/login.dart';

// We use name route

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  // LoginScreen.routeName: (context) => const LoginScreen(),
  // TripPlanDetails.routeName: (context) => const TripPlanDetails(),
  LoginScreen.routeName: (context) =>const LoginScreen(),

};
