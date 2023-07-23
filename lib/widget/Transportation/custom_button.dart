import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final double width;
  final EdgeInsets margin;
  final Function() onPressed;

  const CustomButton({Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 55,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xff5C40CC),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xffFFFFFF)),
          )),
    );
  }
}
