import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final String activity;
  final FontWeight fontWeight;
  const TripActivities({Key? key, required this.activity,required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: Text(activity,
        style: TextStyle(
            fontSize: 12,
            fontWeight: fontWeight,
        ),
      ),
    );
  }
}


