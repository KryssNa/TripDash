import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/AdminDashboard.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import '../Screens/UserScreen/Profile/UpdateUserProfile.dart';
import '../Screens/UserScreen/Profile/UserProfile.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import '../Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import '../Screens/add-hotels.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/add-hotels.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/add-hotels.dart';

// We use name route

final Map<String, WidgetBuilder> routes = {
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  TripPlanOverview.routeName: (context) => const TripPlanOverview(),
  UpdateUserProfile.routeName: (context) => const UpdateUserProfile(),
  UserProfile.routeName: (context) => const UserProfile(),
  TripPlanDetails.routeName: (context) => const TripPlanDetails(),
  AdminDashboard.routeName: (context) => const AdminDashboard(),
  UserHotelScreen.routeName: (context) => const UserHotelScreen(),
  AdminAddHotels.routeName: (context) => const AdminAddHotels(),
};
