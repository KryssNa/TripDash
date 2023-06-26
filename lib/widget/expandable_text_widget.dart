
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String desText;
  const ExpandableTextWidget({Key? key, required this.desText})
      : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  //if long text xa vane
  bool hiddenText = true;
  double textHeight = 310; //yesma prblm aauna sakxa

  //check length of the text passed
  @override
  void initState() {
    super.initState();
    if (widget.desText.length > textHeight) {
      firstHalf = widget.desText.substring(0, textHeight.toInt());
      secondHalf = widget.desText.substring(
          textHeight.toInt() + 1, widget.desText.length);
    } else {
      firstHalf = widget.desText;
      //becoz yo late variable ho ani initialize garnai parxa
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf, style: const TextStyle(fontSize: 15, height: 1.8))
          : Column(
              children: [
                Text(
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.8,
                    ),
                    hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? "Show more" : "Show less",
                        style: const TextStyle(
                            color: Color(0xff956d54),
                            fontSize: 18,
                            height: 1.8),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blueGrey,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
