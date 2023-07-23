import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailsItem({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(children: [
        Container(
          width: 16,
          height: 16,
          margin: const EdgeInsets.only(right: 6),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('Assets/icons/icon_check.png')),
          ),
        ),
        Text(title, style: const TextStyle(color: Color(0xff1F1449))),
        const Spacer(),
        Text(
          valueText,
          style:
          TextStyle(
              fontWeight: FontWeight.w500, color: valueColor),
        )
      ]),
    );
  }
}
