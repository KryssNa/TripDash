import 'package:flutter/material.dart';
import 'package:tripdash/Screens/UserScreen/app_bar.dart';

import '../user_app_drawer.dart';

class ViewProducts extends StatefulWidget {
  static const routeName = '/ViewProducts';
  const ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserAppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), // Change the height as desired
        child: AppBarWidget(avatar: 'Assets/avatars/av_1.png'),
      ),
    );
  }
}
