import 'package:flutter/material.dart';

import '../AboutUs/about_us.dart';

class UserSetting extends StatefulWidget {
  static String routeName = "/UserSetting";
  const UserSetting({Key? key}) : super(key: key);

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'UserSetting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top : 10.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Notifications'),
                  subtitle: const Text('All the notifications'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/notification.png'),
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
                    child: Image.asset('Assets/icons/feedback.png'),
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
                    child: Image.asset('Assets/icons/terms.png'),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('About Us'),
                  subtitle: const Text('About TripDash'),
                  leading: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Image.asset('Assets/icons/about.png'),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xff9698A9),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
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
                  onTap: () {
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
