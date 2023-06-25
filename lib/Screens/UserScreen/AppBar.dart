import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAppBar extends StatefulWidget {
  const UserAppBar({Key? key}) : super(key: key);
  static String routeName = "/UserAppBar";

  @override
  State<UserAppBar> createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
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
        avatar = data['avatar'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Change the height as desired
          child: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
              icon: Icon(Icons.menu_sharp),
              iconSize: 40,
            ),
            actions: [
              InkWell(
                onTap: () {
                  // Handle settings tap
                  print('Settings tapped');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.question_mark_outlined,
                    size: 24,
                  ),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text('Account'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Dashboard'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Logout'),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text('Settings'),
                      value: 4,
                    ),
                  ];
                },
                onSelected: (value) {
                  // Handle dropdown menu selection
                  if (value == 1) {
                    // Option 1 selected
                    print('Account selected');
                  } else if (value == 2) {
                    // Option 2 selected
                    print('Dashboard selected');
                  } else if (value == 3) {
                    // Option 3 selected
                    print('Logout selected');
                  }
                },
                child: CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Handle item 1 tap
                  print('Item 1 tapped');
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Handle item 2 tap
                  print('Item 2 tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
