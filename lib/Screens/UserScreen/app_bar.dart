import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/widget/Notification/notification_list.dart';

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

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.avatar,
  });

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      leading: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu_sharp),
          color: Colors.orange,
        ),
      ),
      actions: [
        // Search Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.search),
            color: Colors.orange,
          ),
        ),
        // Notification Icon
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsList()),
              );
            },
            icon: const Icon(Icons.notifications),
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
