import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Screens/AdminScreen/CustomerDetail/customer_detail.dart';
import 'package:tripdash/Screens/UserScreen/update_password.dart';

import '../../../constant/colors.dart';

class UpdateCustomerDetail extends StatefulWidget {
  final String userDocumentName;

  const UpdateCustomerDetail({Key? key, required this.userDocumentName})
      : super(key: key);

  @override
  UpdateCustomerDetailState createState() => UpdateCustomerDetailState();
}

class UpdateCustomerDetailState extends State<UpdateCustomerDetail> {
  late final DocumentReference docUser;
  String avatar = "";
  String avatarValue = "";
  String nameValue = "";
  String addressValue = "";
  num? phoneNoValue;
  String password = "";
  String emailValue = "";
  String? selectedGender;
  num? balance;
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
  TextEditingController balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    docUser = FirebaseFirestore.instance.collection('users').doc(widget.userDocumentName);
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      DocumentSnapshot document =
      await FirebaseFirestore.instance.collection('users').doc(widget.userDocumentName).get();

      if (document.exists) {
        var data = document.data() as Map<String, dynamic>;
        setState(() {
          emailController.text = data['email'] ?? '';
          nameController.text = data['name'] ?? '';
          phoneNoController.text = data['phone'].toString();
          addressController.text = data['address'] ?? '';
          selectedGender = data['gender'] ?? '';
          avatarController.text = data['avatar'] ?? '';
          passwordController.text = data['password'] ?? '';
          balanceController.text  = data['balance'].toString();
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
      // Handle the error gracefully
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
    passwordController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User List'),
        centerTitle: true,
        backgroundColor: const Color(0xFF007096),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerDetail(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
                  backgroundImage: AssetImage(avatarController.text),
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
                                        avatarController.text = 'Assets/images/avatars/av_1.png';
                                        avatar = 'Assets/images/avatars/av_1.png';
                                      });
                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: const CircleAvatar(
                                      radius: 65,
                                      backgroundImage: AssetImage('Assets/images/avatars/av_1.png'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        avatarController.text = 'Assets/images/avatars/av_2.png';
                                        avatar = 'Assets/images/avatars/av_2.png';
                                      });
                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: const CircleAvatar(
                                      radius: 65,
                                      backgroundImage: AssetImage('Assets/images/avatars/av_2.png'),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
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
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 2, bottom: 2),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  emailController.text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                          hintText: address.isEmpty ? '--Not Provided--' : address,
                        ),
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
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: balanceController,
                        decoration: InputDecoration(
                          labelText: 'Balance.',
                          hintText: '$balance',
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
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const UpdatePassword(),
                              ),
                          );
                        },
                        child: const Text('Update Pasword'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 15, top: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(const Size(350, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor),
                          foregroundColor: MaterialStateProperty.all<Color>(ConstColors.buttonColor2),
                        ),
                        onPressed: () {
                          if (nameController.text.isEmpty ||
                              addressController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              phoneNoController.text.isEmpty||
                              passwordController.text.isEmpty ||
                              balanceController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill all fields')),
                            );
                            return;
                          }
                          try {
                            docUser.update({
                              'name': nameController.text,
                              'email': emailController.text,
                              'phone': phoneNoController.text,
                              'address': addressController.text,
                              'gender': selectedGender,
                              'avatar': avatarController.text,
                              'password': passwordController.text,
                              'balance': num.parse(balanceController.text),
                            }).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Profile updated successfully!')),
                              );
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to update: $error')),
                              );
                            });
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('An error occurred while updating the profile: $error')),
                            );
                          }
                        },
                        child: const Text("Update Profile"),
                          ),
                        ),
                  ],
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}
