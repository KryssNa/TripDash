import 'package:flutter/material.dart';
import '../constant/Fonts.dart';

TextStyle buildTextStyle(Color? color) {
  return TextStyle(
      color: color,
      fontFamily: ConstFonts.PrimaryFont,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 1
  );
}