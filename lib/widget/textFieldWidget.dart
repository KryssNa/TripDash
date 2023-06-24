import 'package:flutter/material.dart';

import '../../../../constant/Colors.dart';

class textField extends StatelessWidget {
  textField({
    super.key, required this.titleHeading, required this.hintText, required this.controller,this.prefixIcon
    ,this.suffixIcon,  required this.obscureText, this.Validator
  });
  final String titleHeading;
  final String hintText;
  final TextEditingController controller;
  IconData? prefixIcon;
  Widget? suffixIcon;
  final bool obscureText;
  String? Function(dynamic)? Validator;

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
            validator: Validator,
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
