// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tripdash/constant/colors.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key, required this.titleHeading, required this.hintText, required this.controller,this.prefixIcon
    ,this.suffixIcon,  required this.obscureText, this.validator
  });
  final String titleHeading;
  final String hintText;
  final TextEditingController controller;
  IconData? prefixIcon;
  Widget? suffixIcon;
  final bool obscureText;
  String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleHeading,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'SSFPro',
            // fontWeight: FontWeight.bold,
            color: ConstColors.primaryTextColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),

          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText:obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon ,
              hintText: hintText ,

              hintStyle: const TextStyle(
                color: ConstColors.secondaryTextColor,
              ),
              border: const UnderlineInputBorder(

                borderSide: BorderSide(color: Colors.deepOrange),
              ),

            ),
          ),
        ),
      ],
    );
  }
}
