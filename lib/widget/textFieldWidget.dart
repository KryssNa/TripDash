import 'package:flutter/material.dart';

import '../../../../constant/Colors.dart';
import '../Screens/UserScreen/RegisterScreen.dart';



class textField extends StatelessWidget {
  textField({
    super.key, required this.titleHeading, required this.hintText, required this.controller,this.prefixIcon
    ,this.obscureText,this.suffixIcon
  });
  final String titleHeading;
  final String hintText;
  final TextEditingController controller;
  IconData? prefixIcon;
  bool? obscureText=RegisterScreen.changePaswordState;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleHeading,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'SSFPro',
            // fontWeight: FontWeight.bold,
            color: ConstColors.primaryTextColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),

          child: TextFormField(
            controller: controller,
            obscureText: RegisterScreen.changePaswordState,
            decoration: InputDecoration(
              suffixIcon: suffixIcon ,
              hintText: hintText ,
              hintStyle: TextStyle(
                color: ConstColors.secondaryTextColor,
              ),
              border: UnderlineInputBorder(

                borderSide: BorderSide(color: Colors.deepOrange),
              ),

            ),
          ),
        ),
      ],
    );
  }
}
