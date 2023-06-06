import 'package:flutter/material.dart';

import '../../constant/Colors.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static const routeName = '/AdminDashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is app bar"),
      ),
      body: SafeArea(
        child:Container(
          color: ConstColors.whiteColor,
        ),
      ),
    );
  }
}
