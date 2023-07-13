import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/model/user_model.dart';

import 'CustomerDetail/update_customer_detail.dart';

class AdminTransactionScreen extends StatefulWidget {
  const AdminTransactionScreen({super.key});
  static const routeName = '/AdminTransactionScreen';

  @override
  State<AdminTransactionScreen> createState() => _AdminTransactionScreenState();
}

class _AdminTransactionScreenState extends State<AdminTransactionScreen> {

  CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('TopUpPayment');
  List<DocumentSnapshot> userDocuments = [];
  UserModel? user;

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
  
  UserModel fetDetailsById(String id)  {
    
       user=  UserRepositeries.getUserById(id) as UserModel?;
      return user!;
    
      // Handle the error gracefully
    }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List',style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor:Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: ListView.builder(
        itemCount: userDocuments.length,
        itemBuilder: (BuildContext context, int index) {
          DocumentSnapshot userSnapshot = userDocuments[index];
          Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>; // Explicit cast

          UserModel users= fetDetailsById(userData['userId']);
           

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                title: Text(
                  userData['userName'] ?? '',
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
                      'Email: ${users.phone ?? ''}',
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
