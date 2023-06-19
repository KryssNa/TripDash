import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBDACE),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("Assets/images/avatars/av_1.png"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 5.0), // Adjust the bottom margin as desired
            child: Text(
              "Hari",
              style: TextStyle(),
            ),
          ),
          Text(
            "981800000",
            style: TextStyle(),
          ),
        ],
      ),

    );
  }
}
