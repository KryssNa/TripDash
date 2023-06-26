import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Screens/UserScreen/Profile/update_user_profile.dart';
import 'package:tripdash/widget/UserProfile/user_detail.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static String routeName = "/UserProfile";

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Color orange = Color(int.parse("FF6700", radix: 16)).withOpacity(1.0);
  Color divider = Color(int.parse("777F88", radix: 16)).withOpacity(1.0);
  TextEditingController emailController = TextEditingController();
  Color secondaryText = Color(int.parse("777F88", radix: 16)).withOpacity(1.0);
  String? selectedGender;
  String email = '';
  String name = '';
  String address = '';
  String gender = '';
  String phone = "";
  String avatar = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
        await firestore.collection('users').doc('user_1').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        email = data['email'] ?? '';
        name = data['name'] ?? '';
        phone = data['phone'] ?? '';
        address = data['address'] ?? '';
        gender = data['gender'] ?? '';
        avatar = data['avatar'] ?? '';
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
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(avatar),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateUserProfile()),
                        );
                      },
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
                    size: 18,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
              UserDetails(
                type: 'Name',
                value: name,
                rightValue: 60,
                secondaryText: secondaryText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(
                type: 'Address',
                value: address.isEmpty ? '--Not Provided--' : address,
                rightValue: 40,
                secondaryText: secondaryText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(
                type: 'Email',
                value: email,
                rightValue: 62,
                secondaryText: secondaryText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(
                type: 'Gender',
                value: gender,
                rightValue: 50,
                secondaryText: secondaryText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                child: Divider(
                  color: divider,
                  thickness: 1,
                ),
              ),
              UserDetails(
                type: 'Phone No.',
                value: phone,
                rightValue: 26,
                secondaryText: secondaryText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
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
