import 'package:flutter/material.dart';

import '../../widget/AdminAppDrawer/DrawerList.dart';
import '../../widget/AdminAppDrawer/HeaderDrawer.dart';

class AdminAppDrawer extends StatefulWidget {
  const AdminAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/AdminDashboard';

  @override
  State<AdminAppDrawer> createState() => _AdminAppDrawerState();
}

class _AdminAppDrawerState extends State<AdminAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trip Dash"
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Home Screen"
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),
                DrawerList(),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
