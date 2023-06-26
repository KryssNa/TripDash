import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


  //to use appBar flow this code
/* appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), // Change the height as desired
          child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
        ),
        */

  String? avatar;
  @override
  void initState() {
    fetchData();
  }
//
  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('users').doc('user_1').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
        avatar = data['avatar'] ?? '';

    }
  }


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.avatar,
  });

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff0079c0),
      shape: const RoundedRectangleBorder(
      ),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open the drawer
        },
        icon: const Icon(Icons.menu_sharp),
        iconSize: 40,
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 1,
                child: Text('Account'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Dashboard'),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text('Logout'),
              ),
            ];
          },
          onSelected: (value) {
            // Handle dropdown menu selection
            if (value == 1) {
              // Option 1 selected
              if (kDebugMode) {
                print('Account selected');
              }
            } else if (value == 2) {
              // Option 2 selected
              if (kDebugMode) {
                print('Dashboard selected');
              }
            } else if (value == 3) {
              // Option 3 selected
              if (kDebugMode) {
                print('Logout selected');
              }
            }
          },
          child: CircleAvatar(
            radius: 34,
            backgroundImage: AssetImage(avatar),
          ),
        ),
      ],
    );
  }
}
