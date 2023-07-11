import 'package:flutter/material.dart';

import '../faq.dart';

class Account extends StatefulWidget {
  static String routeName = "/Account";
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('Assets/images/Bali.png'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Rose Helbert',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                              icon: Image.asset('Assets/images/wallet.png'),
                              onPressed:(){

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
                              icon: Image.asset('Assets/images/mapp.png'),
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
                              icon: Image.asset('Assets/images/booking.png'),
                              onPressed:(){},
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
                              icon: Image.asset('Assets/images/calendar.png'), onPressed: () {},
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
                  title: const Text('Settings'),
                  subtitle: const Text('Privacy and logout'),
                  leading: Image.asset('Assets/images/settings.png'),
                  trailing: const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('Help & Support'),
                  subtitle: const Text('Help center and legal support'),
                  leading: Image.asset('Assets/images/supportt.png'),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('FAQ'),
                  subtitle: const Text('Questions and Answer'),
                  leading: Image.asset('Assets/images/faq.png'),
                  trailing: const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FAQ(),
                      ),
                    );
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

