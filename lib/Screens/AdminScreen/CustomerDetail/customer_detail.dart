import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripdash/Screens/AdminScreen/CustomerDetail/UpdateCustomerDetail.dart';
import 'package:tripdash/Screens/AdminScreen/admin_app_drawer.dart';

class CustomerDetail extends StatefulWidget {
  static const routeName = '/CustomerDetail';

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
      QuerySnapshot querySnapshot = await usersCollection.get();
      setState(() {
        userDocuments = querySnapshot.docs;
      });
    } catch (error) {
      print('Error retrieving users: $error');
      // Handle the error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: AdminAppDrawer(),
        appBar: AppBar(
          title: Text('User List'),
          centerTitle: true,
          backgroundColor: Color(0xFF007096),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: userDocuments.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot userSnapshot = userDocuments[index];
              Map<String, dynamic> userData =
              userSnapshot.data() as Map<String, dynamic>; // Explicit cast

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      userData['name'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Email: ${userData['email'] ?? ''}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Phone: ${userData['phone'] ?? ''}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateCustomerDetail(
                              UserDocumentName: userSnapshot.id,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xA25A9AE5),
                        onPrimary: Colors.white,
                      ),
                      child: Text('Edit'),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
