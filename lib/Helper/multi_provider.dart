import 'package:flutter/material.dart';

// multiprovider

import 'package:provider/provider.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';

import 'package:get/get.dart';

import '../ViewModel/hotel_viewmodel.dart';

class MultiProviderWidget extends StatelessWidget {
  const MultiProviderWidget({Key? key,  required this.child}) : super(key: key);
  final GetMaterialApp child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider<AuthViewModel>(
              create: (_) => AuthViewModel()),
          ChangeNotifierProvider<HotelViewModel>(create: (_) => HotelViewModel()),


        ],
      child:child,
    );
  }
}