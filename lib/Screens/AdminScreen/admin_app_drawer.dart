import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AdminScreen/add_hotel.dart';
import 'package:tripdash/Screens/AdminScreen/add_product.dart';
import 'package:tripdash/Screens/homepage/home_page.dart';
import 'package:intl/intl.dart';


//AdminAppDrawer
class AdminAppDrawer extends StatefulWidget {
  const AdminAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/AdminDashboard';

  @override
  State<AdminAppDrawer> createState() => _AdminAppDrawerState();
}

class _AdminAppDrawerState extends State<AdminAppDrawer> {
  String name = '';
  String avatar = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot document =
    await firestore.collection('Admin').doc('Admin_1').get();

    if (document.exists) {
      var data = document.data() as Map<String, dynamic>;
      setState(() {
        name = data['name'] ?? '';
        email = data['email'] ?? '';
        avatar = data['avatar'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(now);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            accountEmail: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formattedDateTime,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  avatar,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFBDACE),
            ),
          ), 
          ListTile(
            leading: const Icon(Icons.place_outlined),
            title: const Text("Place"),
            onTap: () => Navigator.pushReplacementNamed(context, Homepage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.hotel_outlined),
            title: const Text("Hotels"),
            onTap: () => Navigator.pushReplacementNamed(context, AdminAddHotels.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Product"),
            onTap: () => Navigator.pushReplacementNamed(context, AddProduct.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text("Exit"),
            onTap: () => Navigator.pop(context),
          ),

        ],
      ),
    );
  }
}





