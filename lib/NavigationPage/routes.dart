import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/add_events.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_product.dart';
import 'package:tripdash/Screens/AdminScreen/add_place.dart';

import 'package:tripdash/Screens/AdminScreen/admin_dashboard.dart';
import 'package:tripdash/Screens/UserScreen/AboutUs/about_us.dart';
import 'package:tripdash/Screens/UserScreen/Profile/update_user_profile.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
import 'package:tripdash/Screens/UserScreen/user_dashboard.dart';
import 'package:tripdash/Screens/auth/register_screen.dart';

import 'package:tripdash/Screens/auth/login_screen.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';

// We use name route

final Map<String, WidgetBuilder> routes = {
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  TripPlanOverview.routeName: (context) => const TripPlanOverview(),
  UpdateUserProfile.routeName: (context) => const UpdateUserProfile(),
  UserProfile.routeName: (context) => const UserProfile(),
  TripPlanDetails.routeName: (context) => const TripPlanDetails(),
  AdminDashboard.routeName: (context) => const AdminDashboard(),
  AdminAddHotels.routeName: (context) => const AdminAddHotels(),
  AdminAddEvents.routeName: (context) => const AdminAddEvents(),
  Homepage.routeName: (context) => const Homepage(),

  AddProduct.routeName: (context) => const AddProduct(),

  UserDashboard.routeName: (context) => const UserDashboard(),
  AdminAddPlaces.routeName: (context) => const AdminAddPlaces(),
  ViewProducts.routeName: (context) => const ViewProducts(),
  AboutUs.routeName: (context) => const AboutUs(),
  BottomNavigationBarWidget.routeName: (context) =>
      const BottomNavigationBarWidget(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  // AdminAppDrawer.routeName: (context) => const AdminAppDrawer(),
};
