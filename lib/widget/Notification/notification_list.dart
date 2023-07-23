import 'package:flutter/material.dart';

class NotificationsList extends StatefulWidget {
  static String routeName = "/NotificationList";
  const NotificationsList({Key? key}) : super(key: key);

  @override
  NotificationsListState createState() => NotificationsListState();
}

class NotificationsListState extends State<NotificationsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Notifications", // Your desired title here
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Centers the title in the AppBar
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'Assets/images/notifications.jpg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "No notifications right now",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
