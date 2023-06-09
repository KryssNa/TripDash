import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_detail.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
<<<<<<< HEAD

import '../Screens/AdminScreen/addhotel.dart';
import '../Screens/add-hotels.dart';
=======
>>>>>>> master

// We use name route

final Map<String, WidgetBuilder> routes = {
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  TripPlanOverview.routeName: (context) => const TripPlanOverview(),
  TripPlanDetails.routeName: (context) => const TripPlanDetails(),
<<<<<<< HEAD
  UserHotelScreen.routeName: (context) => const UserHotelScreen(),
  AdminAddHotels.routeName: (context) => const AdminAddHotels(),
=======

>>>>>>> master
};
