import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/Signup/register.dart';

// We use name route
// All our routes will be available here
// you must create a route name in the corresponding screen file to use it here
// for example : static String routeName = "/register"; in lib\Screens\UserScreen\Signup\register.dart
final Map<String, WidgetBuilder> routes = {
  Register.routeName: (context) => Register(),

};
