import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripdash/constant/colors.dart';

class ConstFonts {
  static const String fontRegular = "Poppins-Regular";
  static const String fontMedium = "Poppins-Medium";
  static const String fontSemiBold = "Poppins-SemiBold";
  static const String fontBold = "Poppins-Bold";
  static const String fontExtraBold = "Poppins-ExtraBold";
  static const String fontLight = "Poppins-Light";
  static const String fontThin = "Poppins-Thin";
  static const String fontExtraLight = "Poppins-ExtraLight";
  static const String fontBlack = "Poppins-Black";

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;

  static const String primaryFont = "SSFPro";

  static TextStyle blackTextStyle = GoogleFonts.poppins(
    color: ConstColors.kBlackColor,
  );

  static TextStyle whiteTextStyle = GoogleFonts.poppins(
    color: ConstColors.kWhiteColor,
  );

  static TextStyle greyTextStyle = GoogleFonts.poppins(
    color: ConstColors.kGreyColor,
  );

  static TextStyle greenTextStyle = GoogleFonts.poppins(
    color: ConstColors.kGreenColor,
  );

  static TextStyle redTextStyle = GoogleFonts.poppins(
    color: ConstColors.kRedColor,
  );

  static TextStyle purpleTextStyle = GoogleFonts.poppins(
    color: ConstColors.kPrimaryColor,
  );
}
