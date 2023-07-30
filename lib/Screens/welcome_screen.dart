import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tripdash/Screens/AdminScreen/admin_dashboard.dart';
import 'package:tripdash/Screens/SplashScreen/splash_screen1.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';
import 'package:tripdash/constant/fonts.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';

import '../Services/notification_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash-screen';

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthViewModel _auth;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 5), () {
        _auth = Provider.of<AuthViewModel>(context, listen: false);
        _auth.checkLogin().then((value) {
          User? user = FirebaseAuth.instance.currentUser;

          if (user == null) {
            // route to onboarding
            Navigator.pushNamedAndRemoveUntil(
                context, SplashScreen1.routeName, (route) => false);
          } else {
            if (_auth.loggedInUser!.role == 'admin') {
              Navigator.pushNamedAndRemoveUntil(
                  context, AdminDashboard.routeName, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(context,
                  BottomNavigationBarWidget.routeName, (route) => false);
            }
          }
          NotificationService.display(
                    title: "Hello ${_auth.loggedInUser!.name!}!",
                    body: "Welcome to TripDash",
                    image: "assets/images/logo.png",
                    logo: "assets/images/logo.png");
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/logo.png'))),
              child: Lottie.asset('Assets/images/lottie2.json'),
            ),
            Text(
              'TripDash',
              style: ConstFonts.whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: ConstFonts.medium,
                  letterSpacing: 10),
            )
          ],
        ),
      ),
    );
  }
}
