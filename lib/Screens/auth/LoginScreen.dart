import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/auth_repositeries.dart';
import 'package:tripdash/Screens/UserScreen/RegisterScreen.dart';
import 'package:tripdash/Screens/UserScreen/UserDashboard.dart';

import '../../ViewModel/auth_viewmodel.dart';
import '../../constant/Colors.dart';
import '../../widget/buttonWidget.dart';
import '../../widget/textFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/LoginScreen";
  static bool changePasswordState = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isChecked = true;
  late AuthViewModel _authen;

  void showHidePassword() {
    setState(() {
      LoginScreen.changePasswordState = !LoginScreen.changePasswordState;
    });
  }

  Widget showVisibilityIcon(bool showPassword) {
    Widget icon = const Icon(Icons.visibility);
    if (showPassword == true) {
      icon = const Icon(Icons.visibility_off);
    }
    return showPassword == LoginScreen.changePasswordState
        ? InkWell(
      onTap: () {
        setState(() {
          LoginScreen.changePasswordState = !LoginScreen.changePasswordState;
        });
      },
      child: icon,
    )
        : InkWell(
      onTap: () {
        setState(() {
          LoginScreen.changePasswordState = !LoginScreen.changePasswordState;
        });
      },
      child: const Icon(Icons.visibility_off),
    );
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Error"),
          content: const Text("Failed to register user."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> loginUser() async {
    // Simulating a delay for user registration
    await Future.delayed(const Duration(seconds: 2));
    // _authen.
    try{

      final user = await AuthRepository().login(emailController.text, passwordController.text);
      Navigator.of(context).pushNamed(UserDashboard.routeName);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    // Return whether the registration is successful or not
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor2,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            // color: ConstColors.primaryColor2,
            image: DecorationImage(
              image: AssetImage('Assets/images/logo.png'),
              alignment: Alignment.topCenter,
            ),
          ),
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
                        const Text(
                          'LOGIN',
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
                          child: Image.asset('Assets/images/img.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: ConstColors.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                textField(
                                  titleHeading: 'Email',
                                  hintText: 'Enter your email',
                                  controller: emailController,
                                  Validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textField(
                                  titleHeading: 'Password',
                                  hintText: 'Enter your password',
                                  obscureText: true,
                                  suffixIcon: showVisibilityIcon(
                                      LoginScreen.changePasswordState),
                                  controller: passwordController,
                                  Validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (value.length < 8 || value.length > 10) {
                                      return "Enter a password of 8 to 10 characters";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked = val!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Keep me logged in',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SSFPro',
                                          color: ConstColors.primaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(onPressed: (){},
                                      child: Text("Forgot password?",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),)
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ButtonWidget(
                                  title: "LOGIN",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Perform login logic
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Logging in...")),
                                      );
                                      loginUser();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t an account?',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SSFPro',
                                          color: ConstColors.primaryTextColor,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Navigate to login screen
                                          Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                                        },
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SSFPro',
                                            color: ConstColors.secondaryColor,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: 700,)
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
          ),
        ),
      ),
    );
  }
}