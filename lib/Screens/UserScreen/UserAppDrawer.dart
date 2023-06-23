import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/AddHotel.dart';
import 'package:tripdash/Screens/UserScreen/Profile/UserProfile.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';


class UserAppDrawer extends StatefulWidget {
  const UserAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/UserAppDrawer';

  @override
  State<UserAppDrawer> createState() => _UserAppDrawerState();
}

class _UserAppDrawerState extends State<UserAppDrawer> {
  String name = '';
  String avatar = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('User').doc('User_1').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        name = data['name'] ?? '';
        email = data['email'] ?? '';
        avatar = data['avatar'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
            accountEmail: Text(email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(avatar,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFBDACE),
            ),
          ),
          ListTile(
            leading: Icon(Icons.place_outlined),
            title: Text("Place"),
            onTap: () => Navigator.pushReplacementNamed(context, Homepage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.hotel_outlined),
            title: Text("Hotels"),
            onTap: () => Navigator.pushReplacementNamed(context, UserProfile.routeName),
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text("Product"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text("Exit"),
            onTap: () => Navigator.pop(context),
          ),

        ],
      ),
    );
  }
}





