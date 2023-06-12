import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});
  static const routeName = '/UserDashboard';

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Color(0xff5d9de7),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,

            actions: [
              Padding(
                padding:  EdgeInsets.only(top:5.0,right: 10),
                child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {

                    },
                    child:CircleAvatar(
                      radius: 25,
                      backgroundImage:
                      AssetImage("Assets/images/avatars/av_1.png"),
                    )
                ),
              ),
            ],
            leading: Builder(
              builder: (context) => IconButton(
                icon:  Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
        ),

        body: SafeArea(
        child: Container(
          child: Text("User Dashboard"),
        ),
      )
    );
  }
}
