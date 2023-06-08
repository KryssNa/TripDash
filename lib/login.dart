import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  static var routeName;

  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  // ignore: no_logic_in_create_state   
  // ignore: unused_field
  
  Widget build(BuildContext context) {
    var GoogleFonts;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child:SizedBox(
              width:300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Welcome Back!'
                  style: SF-Pro.inter(
                    fontSize:17,
                    color:Colors.black,
                   ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login to your account',
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      color:Colors.black,
                      FontWeight: FontWeight.w700,
                   ),
                  ),
                  const SizedBox( height: 35),
                  TextFormField(
                    ),
                  const SizedBox( height: 35),
                  TextFormField(
                    ),
                    const SizedBox( height: 35),
                  TextFormField(
                    ),
                    const SizedBox( height: 35),
                  TextFormField(
                    ),       
              ]
              ),
              ) 
              ),
              )
              ),
    );
  }
}