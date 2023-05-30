import 'package:flutter/material.dart';

 class ConstColors {
  static const Color primaryColor = Color(0xFF0373F3);
  static const Color secondaryColor = Color(0xFF0C0C0C);
  static const Color primaryTextColor = Color(0xFF000000);
  static const Color secondaryTextColor = Color(0xFFB4B4B4);

  static const Color buttonColor = Color(0xFF0373F3);
  static const Color buttonTextColor = Color(0xFFFFFFFF);

  static const Color backColor = Color.fromRGBO(191, 134, 143, 30);
  static const Color iconColor = Color.fromRGBO(0, 0, 0, 1);

  static const primaryGradientColor = LinearGradient(
   begin: Alignment.topLeft,
   end: Alignment.bottomRight,
   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
}

