import 'package:flutter/material.dart';

import 'NotificationService.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key});
  static String routeName = "/NotificationDemo";

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  @override
  Widget build(BuildContext context) {
    return return Scaffold(
      appBar: AppBar(
        title: Text("Notification Demo"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                NotificationService.display(
                    title: "Notification Title",
                    body: "Notification body",
                    image: "assets/images/logo.png",
                    logo: "assets/images/logo.png");
              },
              child: Text("Send Notification"))
        ],
      ),
    );
  }
}