import 'package:flutter/material.dart';
import 'package:tripdash/constant/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({Key? key}) : super(key: key);

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  final docUser = FirebaseFirestore.instance
      .collection('users')
      .doc('1lYNX68bOlPB24z3TDPwfRrlIyK2');
  String nameValue = "";
  String addressValue = "";
  int phoneNoValue = 0;
  String passwordValue = "";
  String emailValue = "";


  Color orange = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
  TextEditingController emailController = TextEditingController();
  String? selectedGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                const CircleAvatar(
                    radius: 75,
                    backgroundImage:
                    AssetImage('Assets/images/avatars/av_1.png')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
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
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Update your name',
                        ),
                      ),
                    ),

                     Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          hintText: 'Update your address',
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Update your email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
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
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: phoneNoController,
                        decoration: InputDecoration(
                          labelText: 'Phone No.',
                          hintText: 'Update your Phone Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 12, left: 15, top: 40),
                      child: ElevatedButton(
                        child: Text("Update Proflie"),
                        style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all<Size>(Size(350, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ConstColors.buttonColor),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ConstColors.buttonColor2),
                        ),
                        onPressed: () {
                          docUser.update({'name':nameController.text,});
                          docUser.update({'email':emailController.text,});
                          docUser.update({'phone':phoneNoController.text,});
                          docUser.update({'address':addressController.text,});
                          docUser.update({'gender':selectedGender,});

                        },
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
}
