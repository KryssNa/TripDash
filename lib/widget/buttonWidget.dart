import 'package:flutter/material.dart';

import '../../../../constant/Colors.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget( {
    super.key, required this.title,  this.onPressed,this.showLoadingIndicator=false,
  });
  VoidCallback? onPressed;
  final String title;
  final bool showLoadingIndicator;

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
      child: showLoadingIndicator
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          :   Text(title,
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