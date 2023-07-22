import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/add_events.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_product.dart';
import 'package:tripdash/Screens/AdminScreen/add_place.dart';
import 'package:tripdash/Screens/AdminScreen/admin_dashboard.dart';
import 'package:tripdash/Screens/AdminScreen/CustomerDetail/customer_detail.dart';
import 'package:tripdash/Screens/AdminScreen/admin_transaction.dart';
import 'package:tripdash/Screens/AuthenticationScreen/login_screen.dart';
import 'package:tripdash/Screens/AuthenticationScreen/register_screen.dart';
import 'package:tripdash/Screens/HotelViewScreen/hotel_home_screen.dart';
import 'package:tripdash/Screens/SplashScreen/splash_screen1.dart';
import 'package:tripdash/Screens/SplashScreen/splash_screen2.dart';
import 'package:tripdash/Screens/SplashScreen/splash_scren3.dart';
import 'package:tripdash/Screens/TransportationScreen/add_bus.dart';
import 'package:tripdash/Screens/TransportationScreen/choose_seat.dart';
import 'package:tripdash/Screens/TransportationScreen/choose_transportation.dart';
import 'package:tripdash/Screens/TransportationScreen/my_transportation_bookings.dart';
import 'package:tripdash/Screens/TransportationScreen/view_details.dart';
import 'package:tripdash/Screens/UserScreen/AboutUs/about_us.dart';
import 'package:tripdash/Screens/UserScreen/Event/calender.dart';
import 'package:tripdash/Screens/UserScreen/help_support.dart';
import 'package:tripdash/Screens/UserScreen/Account/account.dart';
import 'package:tripdash/Screens/UserScreen/Booking/bookings.dart';
import 'package:tripdash/Screens/UserScreen/Settings/settings.dart';
import 'package:tripdash/Screens/UserScreen/account_balance.dart';
import 'package:tripdash/Screens/UserScreen/forgot_password.dart';
import 'package:tripdash/Screens/UserScreen/Event/view_events.dart';
import 'package:tripdash/Screens/UserScreen/Profile/update_user_profile.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
import 'package:tripdash/Screens/UserScreen/faq.dart';
import 'package:tripdash/Screens/UserScreen/payment.dart';
import 'package:tripdash/Screens/UserScreen/user_dashboard.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';
import 'package:tripdash/Screens/HomeScreen/home_page.dart';
import 'package:tripdash/Screens/splash_screen.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';

import '../Notification/NotificationDemo.dart';

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
  ViewEvents.routeName: (context) => const ViewEvents(),
  Homepage.routeName: (context) => const Homepage(),



  ForgotPassword.routeName: (context) => const ForgotPassword(),
  AddProduct.routeName: (context) => const AddProduct(),
  UserDashboard.routeName: (context) => const UserDashboard(),
  AdminAddPlaces.routeName: (context) => const AdminAddPlaces(),
  HelpSupportPage.routeName: (context) => const HelpSupportPage(),
  ViewProducts.routeName: (context) => const ViewProducts(),
  AboutUs.routeName: (context) => const AboutUs(),
  BottomNavigationBarWidget.routeName: (context) =>
      const BottomNavigationBarWidget(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  PlaceHomeScreen.routeName: (context) => const PlaceHomeScreen(),
  DetailPage.routName: (context) => const DetailPage(),
  ChooseSeatPage.routeName: (context) => const ChooseSeatPage(),
  SplashPage.routeName: (context) => const SplashPage(),
  ChooseTransportation.routeName: (context) => const ChooseTransportation(),
  MyBookings.routeName: (context) => const MyBookings(),
  SplashScreen1.routeName: (context) => const SplashScreen1(),
  SplashScreen2.routeName: (context) => const SplashScreen2(),
  SplashScreen2.routeName: (context) => const SplashScreen3(),
  HotelHomeScreen.routeName: (context) => const HotelHomeScreen(),
  FAQ.routeName: (context) => const FAQ(),
  CustomerDetail.routeName: (context) => const CustomerDetail(),

  Calender.routeName: (context) => const Calender(),
  Account.routeName: (context) => const Account(),
  UserSetting.routeName: (context) => const UserSetting(),
  PaymentScreen.routeName: (context) => const PaymentScreen(),
  AccountBalance.routeName: (context) => const AccountBalance(),
  UserBookings.routeName: (context) => const UserBookings(),
  AdminTransactionScreen.routeName: (context) => const AdminTransactionScreen(),
  BusSeatChoosingScreen.routeName: (context) => const BusSeatChoosingScreen(),
  NotificationDemo.routeName: (context) => const NotificationDemo(),
};
