import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/AdminDashboard.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/add-hotels.dart';

// We use name route

final Map<String, WidgetBuilder> routes = {
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  TripPlanOverview.routeName: (context) => const TripPlanOverview(),
  TripPlanDetails.routeName: (context) => const TripPlanDetails(),

  AdminDashboard.routeName: (context) => const AdminDashboard(),

  UserHotelScreen.routeName: (context) => const UserHotelScreen(),
  AdminAddHotels.routeName: (context) => const AdminAddHotels(),
  Homepage.routeName: (context) => const Homepage(),
 };

