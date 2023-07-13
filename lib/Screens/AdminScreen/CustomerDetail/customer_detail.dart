import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Screens/AdminScreen/CustomerDetail/update_customer_detail.dart';
import 'package:tripdash/Screens/AdminScreen/admin_app_drawer.dart';

class CustomerDetail extends StatefulWidget {
  static const routeName = '/CustomerDetail';

  const CustomerDetail({super.key});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
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
      QuerySnapshot querySnapshot = await usersCollection.where("role", isEqualTo: "normal").get();
      setState(() {
        userDocuments = querySnapshot.docs;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error retrieving users: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AdminAppDrawer(),
        appBar: AppBar(
          title: const Text('User List'),
          centerTitle: true,
          backgroundColor: const Color(0xFF007096),
        ),
        body: ListView.builder(
          itemCount: userDocuments.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot userSnapshot = userDocuments[index];
            Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>; // Explicit cast

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: ListTile(
                  title: Text(
                    userData['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Email: ${userData['email'] ?? ''}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Phone: ${userData['phone'] ?? ''}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      String userDocumentId = userSnapshot.id; // Retrieve document ID
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateCustomerDetail(userDocumentName: userDocumentId),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xA25A9AE5),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Edit'),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
