import 'package:flutter/material.dart';


class TripButton extends StatelessWidget {
  final String texts;
  const TripButton({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:(){

      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(int.parse("FF6700", radix: 16)).withOpacity(1.0),
        ),
      ),
      child: Text(
        texts,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
