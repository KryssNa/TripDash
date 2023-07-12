import 'package:flutter/material.dart';

import '../faq.dart';

class Settings extends StatefulWidget {
  static String routeName = "/Settings";
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Notifications'),
                  subtitle: const Text('All the notifications'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/logout.png'),
                  ),
                  trailing:
                  const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('FeedBack'),
                  subtitle: const Text('Provide a feedback about app'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/logout.png'),
                  ),
                  trailing:
                  const Icon(Icons.chevron_right, color: Color(0xff9698A9)),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('Terms and Services'),
                  subtitle: const Text('Terms and values to be followed'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/logout.png'),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('About Us'),
                  subtitle: const Text('About TripDash'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/logout.png'),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
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
