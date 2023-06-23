import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/AddProduct.dart';
import 'package:tripdash/Screens/AdminScreen/AdminAppDrawer.dart';
import 'package:tripdash/Screens/AdminScreen/AdminDashboard.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import '../Screens/UserScreen/Profile/UpdateUserProfile.dart';
import '../Screens/UserScreen/Profile/UserProfile.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import '../Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import '../Screens/UserScreen/UserDashboard.dart';
import '../Screens/add-hotels.dart';

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/add-hotels.dart';

import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';


import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/AdminScreen/addevents.dart';
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
  AdminAddEvents.routeName: (context) => const AdminAddEvents(),
  Homepage.routeName: (context) => const Homepage(),

  UserDashboard.routeName: (context) => const UserDashboard(),
  AddProduct.routeName: (context) => const AddProduct(),
  AdminAppDrawer.routeName: (context) => const AdminAppDrawer(),
};
