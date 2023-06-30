import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String text;

  const InterestItem({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_check.png'))),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff1F1449),
            ),
          ),
        ],
      ),
    );
  }
}
