import 'package:flutter/material.dart';
import '../constant/fonts.dart';

TextStyle buildTextStyle(Color? color) {
  return TextStyle(
      color: color,
      fontFamily: ConstFonts.primaryFont,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1
  );
}