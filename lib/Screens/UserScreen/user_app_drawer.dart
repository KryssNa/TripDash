// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:tripdash/Screens/HotelViewScreen/hotel_home_screen.dart';
// import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
// import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
// import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';

// class UserAppDrawer extends StatefulWidget {
//   const UserAppDrawer({Key? key}) : super(key: key);
//   static const routeName = '/UserAppDrawer';

//   @override
//   State<UserAppDrawer> createState() => _UserAppDrawerState();
// }

// class _UserAppDrawerState extends State<UserAppDrawer> {
//   String name = '';
//   String avatar = '';
//   String email = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     DocumentSnapshot document =
//         await firestore.collection('User').doc('User_1').get();

//     if (document.exists) {
//       var data = document.data() as Map<String, dynamic>;
//       setState(() {
//         name = data['name'] ?? '';
//         email = data['email'] ?? '';
//         avatar = data['avatar'] ?? '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               name,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//             ),
//             accountEmail: Text(
//               email,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//               ),
//             ),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.asset(
//                   avatar,
//                   width: 90,
//                   height: 90,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             decoration: const BoxDecoration(
//               color: Color(0xFFFBDACE),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.place_outlined),
//             title: const Text("Place"),
//             onTap: () =>
//                 Navigator.pushNamed(context, PlaceHomeScreen.routeName),
//           ),
//           ListTile(
//             leading: const Icon(Icons.hotel_outlined),
//             title: const Text("Hotels"),
//             onTap: () =>
//                 Navigator.pushNamed(context, HotelHomeScreen.routeName),
//           ),
//           ListTile(
//             leading: const Icon(Icons.add_circle_outline),
//             title: const Text("Trip Plan Overview"),
//             onTap: () =>
//                 Navigator.pushNamed(context, TripPlanOverview.routeName),
//           ),
//           ListTile(
//             leading: const Icon(Icons.add_circle_outline),
//             title: const Text("Product"),
//             onTap: () => Navigator.pushNamed(context, ViewProducts.routeName),
//           ),
//           ListTile(
//             leading: const Icon(Icons.exit_to_app_outlined),
//             title: const Text("Exit"),
//             onTap: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/HotelViewScreen/hotel_home_screen.dart';
import 'package:tripdash/Screens/UserScreen/TripPlan/trip_plan_overview.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/view_products.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';

class UserAppDrawer extends StatefulWidget {
  const UserAppDrawer({Key? key}) : super(key: key);
  static const routeName = '/UserAppDrawer';

  @override
  State<UserAppDrawer> createState() => _UserAppDrawerState();
}

class _UserAppDrawerState extends State<UserAppDrawer> {
  String name = '';
  String avatar = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('users').doc(user.uid).get();

      if (snapshot.exists) {
        var data = snapshot.data()!;
        setState(() {
          name = data['name'] ?? '';
          email = data['email'] ?? '';
          avatar = data['avatar'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            accountEmail: Text(
              email,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(avatar==''?'Assets/avatars/av_1.png':avatar,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFBDACE),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.place_outlined),
            title: const Text("Place"),
            onTap: () =>
                Navigator.pushNamed(context, PlaceHomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.hotel_outlined),
            title: const Text("Hotels"),
            onTap: () =>
                Navigator.pushNamed(context, HotelHomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Trip Plan Overview"),
            onTap: () =>
                Navigator.pushNamed(context, TripPlanOverview.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Product"),
            onTap: () => Navigator.pushNamed(context, ViewProducts.routeName),
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

