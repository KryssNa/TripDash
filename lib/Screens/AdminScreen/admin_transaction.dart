import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'CustomerDetail/update_customer_detail.dart';

class AdminTransactionScreen extends StatefulWidget {
  const AdminTransactionScreen({super.key});
  static const routeName = '/AdminTransactionScreen';

  @override
  State<AdminTransactionScreen> createState() => _AdminTransactionScreenState();
}

class _AdminTransactionScreenState extends State<AdminTransactionScreen> {

  CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');
  List<DocumentSnapshot> userDocuments = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
      setState(() {
        userDocuments = querySnapshot.docs;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error retrieving users: $error');
      }
      // Handle the error gracefully
    }
  }
  @override
  Widget build(BuildContext context) {
    return
  }
}
