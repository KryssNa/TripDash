import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'NotificationService.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({Key? key}) : super(key: key);
   static const routeName = '/NotificationDemo';

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                NotificationService.display(
                    title: "WELCOME USER",
                    body: "You have successfully login ",
                    image: "assets/images/logo.png",
                    logo: "assets/images/logo.png");
              },
              child: Text("YOU ARE sUCCESSFULL LOGIN "))
        ],
      ),
    );
  }
}