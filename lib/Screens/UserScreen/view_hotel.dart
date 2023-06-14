import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class view_hotel extends StatelessWidget {
  static var routeName;

  const view_hotel({super.key});

  @override
  Widget build(BuildContext context) {
    var activity;
    return Container(
      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
      height: 170.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: <Widget>[
          Text(activity.name),
          Text('\$${activity.price}'),
        ]),
    );
  }
}