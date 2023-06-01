import 'package:flutter/material.dart';

import '../../constant/Colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String routeName = "/RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColors.primaryColor2,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [

                    const Text('REGISTER',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SSFPro',
                        letterSpacing: 1.2,
                        color: ConstColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 200,
                      child:Image.asset('Assets/images/register.png'),
                    )
                  ],
                ),
              ],
            ),
          ),

        )
      )
    );
  }
}
