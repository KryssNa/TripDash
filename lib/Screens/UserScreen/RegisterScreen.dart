import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/auth_viewmodel.dart';
import '../../constant/Colors.dart';
import '../../widget/buttonWidget.dart';
import '../../widget/textFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String routeName = "/RegisterScreen";
  static bool changePaswordState = false;

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
  bool _isChecked = true;
  late AuthViewModel _authen;

  showHidePassword() {
    setState(() {
      RegisterScreen.changePaswordState = !RegisterScreen.changePaswordState;
    });
  }

  @override
  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text("Error"),
          content: Text("Failed to register user."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget showVisibilityIcon(bool showPassword) {
    Widget icon = const Icon(Icons.visibility);
    if (showPassword != false) {
      icon = const Icon(Icons.visibility_off);
    }
    return showPassword == RegisterScreen.changePaswordState
        ? InkWell(
            onTap: () {
              setState(() {
                RegisterScreen.changePaswordState =
                    !RegisterScreen.changePaswordState;
              });
            },
            child: icon)
        : InkWell(
            onTap: () {
              setState(() {
                RegisterScreen.changePaswordState =
                    !RegisterScreen.changePaswordState;
              });
            },
            child: const Icon(Icons.visibility_off));
  }

  Future<bool> registerUser() async {
    // Simulating a delay for user registration
    await Future.delayed(Duration(seconds: 2));

    // Return whether the registration is successful or not
    return true;
  }

  void register() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    try {
      await _authen
          .register(UserModel(
        name: _fullNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
      ))
          .then((value) {
        //show success message
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User Registered Successfully")));
        // Navigator.of(context).pushReplacementNamed("/userLogin");
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  @override
  void initState() {
    _authen = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              // color: ConstColors.primaryColor2,
              image: DecorationImage(
                image: AssetImage('Assets/images/logo.png'),
                alignment: Alignment.topCenter,
              ),
            ),
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
                          const Text(
                            'REGISTER',
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
                            child: Image.asset('Assets/images/register.png'),
                          )
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
                                    titleHeading: 'Name',
                                    hintText: 'Enter your name',
                                    controller: nameController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  textField(
                                    titleHeading: 'Email',
                                    hintText: 'Enter your email',
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  textField(
                                    titleHeading: 'Phone Number',
                                    hintText: 'Enter your phone number',
                                    controller: phoneController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  textField(
                                    titleHeading: 'Password',
                                    hintText: 'Enter your password',
                                    obscureText: true,
                                    suffixIcon: showVisibilityIcon(
                                        RegisterScreen.changePaswordState),
                                    controller: passwordController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  textField(
                                      titleHeading: 'Confirm Password',
                                      hintText: 'Confirm your password',
                                      obscureText: false,
                                      suffixIcon: showVisibilityIcon(
                                          RegisterScreen.changePaswordState),
                                      controller: confirmPasswordController),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Row(
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
                                          'I agree to the terms and conditions',
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ButtonWidget(
                                    title: "REGISTER",
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'SSFPro',
                                            // fontWeight: FontWeight.bold,
                                            color: ConstColors.primaryTextColor,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Login',
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
            )));
  }
}
