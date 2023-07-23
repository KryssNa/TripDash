import 'package:flutter/material.dart';

class AppBarSearch extends StatefulWidget {
  static String routeName = "/AppBarSearch";
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  State<AppBarSearch> createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Define the action you want to perform when the back button is pressed
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Center(
        child: Text('Your content goes here'),
      ),
    );
  }
}
