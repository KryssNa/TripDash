import 'package:flutter/material.dart';

import '../../../../constant/Colors.dart';


class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key, required this.title,  this.onPressed,
  });
  VoidCallback? onPressed;
  final String title;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(400, 50),
      ),
      child:  Text(title,
        style: const TextStyle(
          fontSize: 28,
          fontFamily: 'SSFPro',
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: ConstColors.buttonColor2,
        ),
      ),
    );
  }
}

