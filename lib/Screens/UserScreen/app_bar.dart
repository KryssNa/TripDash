import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AuthenticationScreen/login_screen.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';

String? avatar;

@override
void initState() {
  fetchData();
}

//
Future<void> fetchData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot document =
  await firestore.collection('User').doc('User_1').get();

  if (document.exists) {
    var data = document.data() as Map<String, dynamic>;
    avatar = data['avatar'] ?? '';
  }
}

AuthViewModel _authViewModel = AuthViewModel();

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.avatar,
  });

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Set the background color to transparent
      elevation: 0, // Remove the shadow under the app bar
      shape: const RoundedRectangleBorder(),
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu_sharp),
        color: Colors.black,
      ),
      actions: [
        // Search Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1), // Set the shadow color with opacity
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              // Handle search action
              // Add your search functionality here
            },
            icon: const Icon(Icons.search),
            color: Colors.white, // Icon color inside the shadow
          ),
        ),
        // Notification Icon
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.black54.withOpacity(0.1), // Set the shadow color with opacity
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              // Handle notification action
              // Add your notification functionality here
            },
            icon: const Icon(Icons.notifications),
            color: Colors.white, // Icon color inside the shadow
          ),
        ),
      ],
    );
  }
}
