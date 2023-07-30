import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Screens/AuthenticationScreen/login_screen.dart';
import 'package:tripdash/Screens/UserScreen/Booking/bookings.dart';
import 'package:tripdash/Screens/UserScreen/Event/calender.dart';
import 'package:tripdash/Screens/UserScreen/Profile/user_profile.dart';
import 'package:tripdash/Screens/UserScreen/Settings/settings.dart';
import 'package:tripdash/Screens/UserScreen/account_balance.dart';
import 'package:tripdash/Screens/UserScreen/help_support.dart';
import 'package:tripdash/ViewModel/auth_viewmodel.dart';

class Account extends StatefulWidget {
  static String routeName = "/Account";
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String avatar = '';
  String name = '';
  User user=FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      DocumentSnapshot document =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (document.exists) {
        var data = document.data() as Map<String, dynamic>;
        setState(() {
          name = data['name'] ?? '';
          avatar = data['avatar'] ?? '';
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
      // Handle the error gracefully
    }
  }
  void _logout() async {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage(avatar==''? 'Assets/avatars/av_1.png':avatar),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff9698A9),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset('Assets/images/wallet.png'),
                              ),
                              onPressed:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AccountBalance(),
                                  ),
                                );
                              },
                            ),
                            const Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('Assets/images/mapp.png')),
                              onPressed:(){},
                            ),
                            const Text(
                              'Map',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('Assets/images/booking.png')),
                              onPressed:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserBookings(),
                                  ),
                                );
                              },
                            ),
                            const Text(
                              'Bookings',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset('Assets/images/calendar.png')),
                              onPressed:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Calender(),
                                  ),
                                );
                              },
                            ),


                            const Text(
                              'Calendar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Update Profile'),
                  subtitle: const Text('Update user information'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/images/profile.png'),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfile(),
                      ),
                    );
                  },
                ),

                const Divider(),
                ListTile(
                  title: const Text('Help & Support'),
                  subtitle: const Text('Help center and legal support'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/images/supportt.png'),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpSupportPage(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Settings'),
                  subtitle: const Text('Privacy and logout'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/images/settings.png'),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserSetting(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Logout'),
                  subtitle: const Text('Logout form the app'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/logout.png'),
                  ),
                  trailing:
                  const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () async {
                    AuthViewModel authViewModel = AuthViewModel();
                    await authViewModel.logout();
                    _logout();

                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

