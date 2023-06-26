import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String type;
  final String value;
  final double rightValue; //Use to provide right side padding as the text aren't aligning properly
  final Color secondaryText;

  const UserDetails({
    Key? key,
    required this.type,
    required this.value,
    required this.rightValue,
    required this.secondaryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 2, right: rightValue),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: secondaryText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
