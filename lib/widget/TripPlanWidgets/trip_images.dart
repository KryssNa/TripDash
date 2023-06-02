import 'package:flutter/material.dart';

class TripImages extends StatelessWidget {
  final String imageAddress;
  final EdgeInsets edgeInsets;
  final double values;
  const TripImages({Key? key, required this.imageAddress, required this.edgeInsets, required this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network( imageAddress,
          fit: BoxFit.fill,
          height: 100,
          width: values,
        ),
      ),
    );
  }
}
