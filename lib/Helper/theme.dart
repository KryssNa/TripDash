import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/Colors.dart';


ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: ConstColors.primaryTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: ConstColors.primaryTextColor, fontSize: 20),
    bodyMedium: TextStyle(color: ConstColors.primaryTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black), toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyMedium, titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).titleLarge, systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
