import 'package:flutter/material.dart';

import '../../constant/Colors.dart';
import '../../widget/buttonWidget.dart';
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

  final _formKey = GlobalKey<FormState>();

  bool changePaswordState = false;
  showHidePassword() {
    setState(() {
      changePaswordState = !changePaswordState;
    });
  }

  Widget showVisibilityIcon(bool showPassword) {
    Widget icon = const Icon(Icons.visibility);
    if (showPassword == false) {
      icon = const Icon(Icons.visibility_off);
    }
    return showPassword == changePaswordState
        ? InkWell(
        onTap: () {
          setState(() {
            changePaswordState = !changePaswordState;
          });
        },
        child: icon)
        : InkWell(
        onTap: () {
          setState(() {
            changePaswordState = !changePaswordState;
          });
        },
        child: const Icon(Icons.key_off));
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColors.primaryColor2,
        child: Form(
          key: _formKey,
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
                              textField(titleHeading: 'Password', hintText: 'Enter your password',obscureText: changePaswordState,suffixIcon: showVisibilityIcon(changePaswordState), controller: passwordController,),
                              const SizedBox(height: 20,),
                              textField(titleHeading: 'Confirm Password', hintText: 'Confirm your password',obscureText: !changePaswordState,suffixIcon: showVisibilityIcon(changePaswordState), controller:confirmPasswordController ),
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
                              const SizedBox(height: 10,),

                              ButtonWidget(title: "REGISTER",
                                onPressed: () {

                                },),
                              const SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SSFPro',
                                        // fontWeight: FontWeight.bold,
                                        color: ConstColors.primaryTextColor,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Login',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SSFPro',
                                          // fontWeight: FontWeight.bold,
                                          color: ConstColors.secondaryColor,
                                        ),
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

          ),
        )
      )
    );
  }
}
