import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/model/user_model.dart';
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
  String? userEmail;
  TextEditingController enteredAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await usersCollection.where("status", isEqualTo: "Pending").get();
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

  Future<UserModel> getUserDetails(String id) async {
    UserModel user = await UserRepositeries.getUserById(id);
    return user;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top-Up List',style: TextStyle(
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
          Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: FutureBuilder<UserModel>(
                future: getUserDetails(userData['userId']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for the future to complete, show a loading indicator
                    return const ListTile(
                      title: Text('Loading...'),
                    );
                  } else if (snapshot.hasError) {
                    // If an error occurred while fetching the user, display an error message
                    return ListTile(
                      title: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    UserModel user = snapshot.data!;
                    return ListTile(
                      title: Text(
                        user.name ?? '',
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
                            'Email: ${user.email ?? ''}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Requested Amount: Rs.${userData['amount'] ?? ''}',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {

                            },
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xA25A9AE5),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('TopUp'),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),

    );
  }
}
