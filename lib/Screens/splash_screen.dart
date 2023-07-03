import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripdash/Screens/AuthenticationScreen/login_screen.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = '/splash-screen';

  @override
  State<StatefulWidget> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  late AuthViewModel _auth;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () {
        _auth = Provider.of<AuthViewModel>(context, listen: false);
        _auth.checkLogin();
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {

          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, BottomNavigationBarWidget.routeName, (route) => false);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/icons/icon_plane.png'))),
            ),
             Text(
              'AIRPLANE',
              style: ConstFonts.whiteTextStyle.copyWith(
                  fontSize: 32, fontWeight: ConstFonts.medium, letterSpacing: 10),
            )
          ],
        ),
      ),
    );
  }
}
