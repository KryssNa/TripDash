import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/widget/UserProfile/UserDetail.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Color orange = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
  Color divider = Color(int.parse("777F88", radix: 16)).withOpacity(1.0);
  TextEditingController emailController = TextEditingController();
  String? selectedGender;
  String email = '';
  String name = '';
  String phone = '';


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('users').doc('1lYNX68bOlPB24z3TDPwfRrlIyK2').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        email = data['email'] ?? '';
        name = data['name'] ?? '';
        phone = data['phone'] ?? '';
      });
    }
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
          icon: const Icon(Icons.arrow_back,
            color: Colors.black,),
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
          child: Column(
            children: [
              const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('Assets/images/avatars/av_1.png')
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
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

              UserDetails(type: 'Name', value: '$name', rightValue: 60),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(type: 'Address', value: '--not provided--', rightValue: 40),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(type: 'Email', value: '$email', rightValue: 62),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(type: 'Gender', value: '--not selected--', rightValue: 50),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(type: 'Phone No.', value: '$phone', rightValue: 26),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}