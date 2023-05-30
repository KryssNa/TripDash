import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String subText;
  final Color color = Colors.black26;
  final Color iconColor;
  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.subText,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          subText,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
