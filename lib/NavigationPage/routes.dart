import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/add_events.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_product.dart';
import 'package:tripdash/Screens/AdminScreen/add_place.dart';

import 'package:tripdash/Screens/AdminScreen/admin_dashboard.dart';
import 'package:tripdash/Screens/AuthenticationScreen/login_screen.dart';
import 'package:tripdash/Screens/AuthenticationScreen/register_screen.dart';
import 'package:tripdash/Screens/Transportation/choose_seat.dart';
import 'package:tripdash/Screens/Transportation/choose_transportation.dart';
import 'package:tripdash/Screens/Transportation/my_bookings.dart';
import 'package:tripdash/Screens/Transportation/view_details.dart';
import 'package:tripdash/Screens/UserScreen/AboutUs/about_us.dart';
import 'package:tripdash/Screens/UserScreen/Profile/update_user_profile.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/UserScreen/user_dashboard.dart';
import 'package:tripdash/Screens/ViewPlace/place_screen.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';

import '../Screens/splash_screen.dart';

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
  AboutUs.routeName: (context) => const AboutUs(),
  BottomNavigationBarWidget.routeName: (context) => const BottomNavigationBarWidget(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  PlaceHomeScreen.routeName: (context) => const PlaceHomeScreen(),
  DetailPage.routName:(context)=>const DetailPage(),
  ChooseSeatPage.routeName :(context) =>const ChooseSeatPage(),
  SplashPage.routeName :(context) =>const SplashPage(),
  ChooseTransportation.routeName :(context) =>const ChooseTransportation(),
  MyBookings.routeName :(context) =>const MyBookings(),
};
