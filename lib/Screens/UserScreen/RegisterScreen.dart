import 'package:flutter/material.dart';

import '../../constant/Colors.dart';
import '../../widget/textFieldWidget.dart';

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
                const SizedBox(height: 0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ConstColors.whiteColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all( 20),
                        child: Column(
                          children: [
                            textField(titleHeading: 'Name', hintText: 'Enter your name' , controller: nameController,),
                            const SizedBox(height: 20,),
                            textField(titleHeading: 'Email', hintText: 'Enter your email', controller: emailController,),
                            const SizedBox(height: 20,),
                            textField(titleHeading: 'Phone Number', hintText: 'Enter your phone number', controller: phoneController,),
                            const SizedBox(height: 20,),
                            textField(titleHeading: 'Password', hintText: 'Enter your password',suffixIcon: const Icon(Icons.visibility,color: Colors.grey,), controller: passwordController,),
                            const SizedBox(height: 20,),
                            textField(titleHeading: 'Confirm Password', hintText: 'Confirm your password',suffixIcon: const Icon(Icons.visibility,color: Colors.grey,), controller:confirmPasswordController ),
                            const SizedBox(height: 20,),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                  const Text('I agree to the terms and conditions',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SSFPro',
                                      // fontWeight: FontWeight.bold,
                                      color: ConstColors.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

        )
      )
    );
  }
}
