import 'package:flutter/material.dart';
import 'package:tripdash/Screens/auth/register_screen.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';
import '../../Repositeries/auth_repositeries.dart';
import '../../constant/colors.dart';
import '../../main.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/LoginScreen";


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool changePasswordState = true;

  final _formKey = GlobalKey<FormState>();
  bool _isChecked = true;
  bool isLoading = false;


  void showHidePassword() {
    setState(() {
      changePasswordState = !changePasswordState;
    });
  }

  Widget showVisibilityIcon(bool showPassword) {
    Widget icon = const Icon(Icons.visibility);
    if (showPassword == true) {
      icon = const Icon(Icons.visibility_off);
    }
    return showPassword == changePasswordState
        ? InkWell(
      onTap: () {
        setState(() {
          changePasswordState = !changePasswordState;
        });
      },
      child: icon,
    )
        : InkWell(
      onTap: () {
        setState(() {
          changePasswordState = !changePasswordState;
        });
      },
      child: const Icon(Icons.visibility_off),
    );
  }

  Future<bool> loginUser() async {
    // Simulating a delay for user registration
    await Future.delayed(const Duration(seconds: 2));
    // _authen.
    try {
      // final user = await AuthRepository().login(emailController.text, passwordController.text);
      await AuthRepository().login(emailController.text, passwordController.text);
      // Navigate to the home page
      navigatorKey.currentState!.pushNamed(BottomNavigationBarWidget.routeName);
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Credentials or \n User does not exist")));
      // showErrorDialog(context, "Invalid Credentials or \n User does not exist");
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
              image: AssetImage("Assets/images/logo.png"),
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
                          child: Image.asset("Assets/images/login.png"),
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
                                TextFieldWidget(
                                  titleHeading: 'Email',
                                  hintText: 'Enter your email',
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  }, obscureText: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWidget(
                                  titleHeading: 'Password',
                                  hintText: 'Enter your password',
                                  obscureText: changePasswordState,
                                  suffixIcon: showVisibilityIcon(
                                      changePasswordState),
                                  controller: passwordController,
                                  validator: (value) {
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
                                  height: 10,
                                ),

                                Row(
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
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(onPressed: (){},
                                      child: const Text("Forgot password?",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),)
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ButtonWidget(
                                  title:isLoading?"Logging in...": "LOGIN",
                                  onPressed: isLoading?null:() async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      // Perform login logic
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Logging in...")),
                                      );
                                      await loginUser();
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                    showLoadingIndicator: isLoading,

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

                                const SizedBox(height: 130,)
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