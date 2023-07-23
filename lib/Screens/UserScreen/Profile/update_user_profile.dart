import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../update_password.dart';

class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({Key? key}) : super(key: key);
  static String routeName = "/UpdateUserProfile";

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {

  static final userId = FirebaseAuth.instance.currentUser!.uid;

  final docUser = FirebaseFirestore.instance.collection('users').doc(userId);
  String avatar = "";
  String avatarValue = "";
  String nameValue = "";
  String addressValue = "";
  num? phoneNoValue;
  String passwordValue = "";
  String emailValue = "";
  String? selectedGender;
  String gender = "";
  String address = "";
  String email = '';
  String name = '';
  num? phone;

  Color orange = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('users').doc(userId).get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        emailController.text = data['email'] ?? '';
        nameController.text = data['name'] ?? '';
        phoneNoController.text = data['phone'].toString();
        addressController.text = data['address'] ?? '';
        selectedGender = data['gender'] ?? 1;
        avatarController.text = data['avatar'] ?? '';
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    passwordController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // Add your logic here
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 85),
              child: Center(
                child: Text(
                  " Profile",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(avatarController.text==''?'Assets/images/avatars/av_1.png':avatarController.text),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Pick Avatar"),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          avatarController.text =
                                          'Assets/images/avatars/av_1.png';
                                          avatar =
                                          'Assets/images/avatars/av_1.png';
                                        });
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: const CircleAvatar(
                                        radius: 65,
                                        backgroundImage: AssetImage(
                                            'Assets/images/avatars/av_1.png'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          avatarController.text =
                                          'Assets/images/avatars/av_2.png';
                                          avatar =
                                          'Assets/images/avatars/av_2.png';
                                        });
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: const CircleAvatar(
                                        radius: 65,
                                        backgroundImage: AssetImage(
                                            'Assets/images/avatars/av_2.png'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          "Update Profile Avatar",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 18,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          hintText:
                          address.isEmpty ? '--Not Provided--' : address,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: email,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          hintText: 'Update your gender',
                        ),
                        value: selectedGender, // Add this line
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        items: <String>[
                          'Male',
                          'Female',
                          'Other',
                        ].map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: phoneNoController,
                        decoration: InputDecoration(
                          labelText: 'Phone No.',
                          hintText: '$phone',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 15, top: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(const Size(350, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor),
                          foregroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor2),
                        ),
                        onPressed: () {
                          // Validate phone number
                          String phoneNumber = phoneNoController.text.trim();
                          if (phoneNumber.length != 10 || int.tryParse(phoneNumber) == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid phone number. It should be a 10-digit number.')),
                            );
                            return;
                          }

                          String email = emailController.text.trim();
                          if (!_isValidEmail(email)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid email format.')),
                            );
                            return;
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            try {
                              docUser.update({
                                'name': nameController.text,
                                'email': email,
                                'phone': phoneNumber,
                                'address': addressController.text,
                                'gender': selectedGender,
                                'avatar': avatarController.text,
                              }).then((_) {
                                Navigator.pop(context); // Close the rotating box alert
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Profile updated successfully!')),
                                );
                              }).catchError((error) {
                                Navigator.pop(context); // Close the rotating box alert
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to update: $error')),
                                );
                              });
                            } catch (error) {
                              Navigator.pop(context); // Close the rotating box alert
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('An error occurred while updating the profile: $error')),
                              );
                            }
                          });
                        },
                        child: const Text("Update Profile"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 15, top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(const Size(350, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor),
                          foregroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor2),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdatePassword()),
                          );
                        },
                        child: const Text("Update Password"),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegExp.hasMatch(email);
  }
}
