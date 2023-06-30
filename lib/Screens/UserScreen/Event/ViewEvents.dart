import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../user_app_drawer.dart';

class ViewEvents extends StatefulWidget {
  static const routeName = '/ViewEvents';
  const ViewEvents({super.key});

  @override
  State<ViewEvents> createState() => _ViewEventsState();
}

class _ViewEventsState extends State<ViewEvents> {
  final CollectionReference _EventCollection = FirebaseFirestore.instance.collection('event');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserAppDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), // Change the height as desired
        child: AppBarWidget(avatar:'Assets/avatars/av_1.png'),
    )
    );
  }
}